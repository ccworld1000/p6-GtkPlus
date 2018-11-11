use v6.c;

use Cairo;
use GTK::Compat::Screen;
use GTK::Compat::Types;
use GTK::Raw::Subs;
use GTK::Raw::Types;

use GTK::Application;
use GTK::Box;
use GTK::Bin;
use GTK::Button;
use GTK::Offscreen;
use GTK::Scale;
use GTK::Widget;
use GTK::Window;

class RotatedBin is GTK::Bin {
  has GTK::Widget $.child;
  has GdkWindow   $.offscreen_window;
  has             $.angle;

  submethod BUILD {
    self.setType('RotatedBin');

    self.setBin(
      bin => g_object_new(GTK::Bin.get_type, Str)
    );
    self.set_has_window(self, True);

    self.damage-event.tap(-> *@a {
      self.window.invalidate_rect(Nil, 0);
      @a[*-1].r = 1;
    });

    self.pick-embedded-child.tap(-> *@a {
      @a[*-1].r = self.pick_offscreen_child(|@a[1..2]);
    });

    # May not be necessary, but just in case.
    self.draw.tap(-> *@a {
      @a[*-1].r = self.draw(|@a);
    });

    self.realize  .tap({ self.do_realize   });
    self.unrealize.tap({ self.do_unrealize });
    self.draw     .tap({ self.do_draw      });
  }

  method pick_offscreen_child($wx, $wy) {
    my GtkAllocation $child_area .= new;
    my Num ($x, $y);

    my $ret = GdkWindow;
    if $!child.defined && $!child.visible {
      ($x, $y) = self.to_child($wx, $wx);
      $!child.get_allocation($child_area);
      if [&&](
        $x >= 0,
        $y >= 0,
        $x < $child_area.width,
        $y < $child_area.height
      ) {
        $ret = $!offscreen_window;
      }
    }
    $ret;
  }

  method do_realize {
    my ($attribute_mask, $border_width);
    my GtkAllocation $allocation;
    my GdkWindow $window;
    my GtkRequisition $child_requisition;
    my GdkWindowAttr $attributes;

    self.realized = True;
    self.get_allocation($allocation);
    $border_width = self.get_border_width;

    my @awh = ($allocation.width, $allocation.height);
    # The C code is more declaritive, but I'm learning hyper ops. They're fun!
    ($attributes.x, $attributes.y) =
      ($allocation.x, $allocation.y) »+« $border_width xx 2;
    ($attributes.width, $attributes.height) =
      ($allocation.width, $allocation.height) »-« (2 * $border_width) xx 2;
    $attributes.window_type = GDK_WINDOW_CHILD;
    $attributes.event_mask = [+|](self.events, |(
      GDK_EXPOSURE_MASK,     GDK_POINTER_MOTION_MASK, GDK_BUTTON_PRESS_MASK,
      GDK_SCROLL_MASK,       GDK_BUTTON_RELEASE_MASK, GDK_ENTER_NOTIFY_MASK,
      GDK_LEAVE_NOTIFY_MASK
    ) );
    $attributes.visual = self.visual;
    $attributes.mask = [+|](GDK_WA_X, GDK_WA_Y, GDK_WA_VISUAL);
    $window = GTK::Compat::Window.(self.parent_window);
    self.window = $window;
    $window.set_user_data(self.widget.p);

    $window.pick-embedded-child.tap(-> *@a {
      @a[*-1].r = self.pick_offscreen_child(
        $!offscreen_window,
        @a[1],
        @a[2],
        self
      );
    });

    $child_requisition.width = $child_requisition.height = 0;
    if $!child && self.visible {
      my GtkAllocation $child_allocation .= new;

      self.get_allocation($child_allocation);
      ($attributes.width, $attributes.height) =
        ($child_allocation.width, $child_allocation.height);
    }
    $!offscreen_window = GTK::Compat::Window.new(
      GTK::Compat::Screen.get_root_window(self.get_screen),
      $attributes,
      $attributes.mask
    );
    $!offscreen_window.set_user_data(self.widget.p);
    .parent_window = $window with $!child;
    $!offscreen_window.set_embedder($window);

    $!offscreen_window.to-embedder.tap(-> *@a {
      self.to_parent( |@a[1..4] );
    });
    $!offscreen_window.from-embedder.tap(-> *@a {
      self.to_child( |@a[1..4] )
    });

    $!offscreen_window.show;
  }

  method do_unrealize {
    $!offscreen_window.set_user_data(gpointer);
    $!offscreen_window.destroy;
    $!offscreen_window = GdkWindow;
    # XXX - Call unrealize on superclass
  }

  method child_type {
    $!child.defined ?? G_TYPE_NONE !! GTK::Widget.get_type;
  }

  method add (GTK::Widget $widget) {
    with $!child {
      note "RotatedBin can only have one child";
    } else {
      $widget.parent_window = $!offscreen_window;
      $widget.parent = self;
      $!child := $widget;
    }
  }

  method remove (GTK::Widget $widget) {
    my $was_visible = $widget.visible;

    if $!child =:= $widget {
      $widget.unparent;
      $!child = Nil;
       self.queue_resize if $was_visible && self.visible;
    }
  }

  method forall (Int() $include_internals, &callback, $data) {
    return without &callback;
    &callback($data);
  }

  method set_angle(Num() $angle) {
    $!angle = $angle;
    self.queue_resize;
    $!offscreen_window.geometry_changed;
  }

  method size_request (GtkRequisition $requisition) {
    my GtkRequisition $child_req .= new;
    my ($s, $c, $w, $h, $dbw);

    $child_req.width = $child_req.height = 0;
    $!child.get_preferred_size($child_req, Nil)
      if $!child.defined && $!child.visible;

    my @wh = ($child_req.width, $child_req.height);
    ($s, $c) = ($!angle.sin, $!angle.cos);
    ($w, $h) = ( [+]( ($c, $s) »*« @wh ), [+]( ($s, $c) »*« @wh ) );
    $dbw = self.border_width * 2;
    ($requisition.width, $requisition.height) = ($dbw + $w, $dbw + $h);
  }

  method get_preferred_width($min is rw, $nat is rw) {
    my GtkRequisition $req .= neq;

    self.size_request($req);
    $min = $nat = $req.width;
  }

  method get_preferred_height($min is rw, $nat is rw) {
    my GtkRequisition $req .= neq;

    self.size_request($req);
    $min = $nat = $req.height;
  }

  method size_allocate(GtkAllocation $allocation) {
    my ($border_width, $w, $h, $s, $c, $dbw);

    self.set_allocation($allocation);
    $dbw = ($border_width = self.border_width) * 2;
    ($w, $h) = ($allocation.width, $allocation.height) »-« $dbw xx 2;
    self.move_resize(
      $allocation.x + $border_width,
      $allocation.y + $border_width,
      $w,
      $h
    ) if self.realized;

    if $!child.defined && $!child.visible {
      my GtkRequisition $child_req .= new;
      my GtkAllocation $child_allo .= new;

      ($s, $c) = ($!angle.sin, $!angle.cos);
      $!child.get_preferred_size($child_req, GtkRequisition);
      $child_allo.x = $child_allo.y = 0;
      if $c =~= 0 {
        $child_allo.width = $h / $s;
      } else {
        $child_allo.width = (
          $w - $s * $child_allo.height / $c,
          $h - $c * $child_allo.height / $s
        ).min;
      }
      $!offscreen_window.move_resize(
        $child_allo.x,
        $child_allo.y,
        $child_allo.width,
        $child_allo.height
      ) if self.realized;
      $child_allo.x = $child_allo.y = 0;
      $!child.size_allocate($child_allo);
    }
  }

  method draw (GtkWidget $widget, cairo_t $cairo_t) {
    my ($s, $c, $w, $h, $cr);
    my GdkWindow $window;

    $window = self.get_window;
    if GTK::Widget.cairo_should_draw_window($cairo_t, $window) {
      my Cairo::cairo_surface_t $surface;
      my GtkAllocation $child_area .= new;

      $cr = Cairo::Context.new( cast(Cairo::cairo_t, $cairo_t) );
      if $!child.defined && $!child.visible {
        $surface = cast(
          Cairo::cairo_surface_t,
          $!offscreen_window.get_surface
        );
        $!child.get_allocation($child_area);

        my @wh = ($child_area.width, $child_area.height);
        ($s, $c) = ($!angle.sin, $!angle.cos);
        ($w, $h) = ( [+]( ($c, $s) »*« @wh ), [+]( ($s, $c) »*« @wh ) );
        my @h = ($child_area.width, $child_area.height) »/« 2 xx 2;
        my ($tw, $th) = ( ($w, $h) »/« 2 xx 2 ) »+« @h;
        $cr.translate($tw, $th);
        $cr.translate(|@h);
        $cr.rotate($!angle);
        $cr.translate( |(@h »*« -1 xx 2) );
        $cr.rectangle(0, 0, $!offscreen_window.width, $!offscreen_window.height);
        $cr.clip;
        $cr.set_source_surface($surface, 0, 0);
        $cr.paint;
      }
      0;
    }

    my $cr_p = cast(cairo_t, $cr);
    if GTK::Widget.should_draw_window($cr_p, $!offscreen_window) {
      GTK::StyleContext.render_background(
        self.get_style_context,
        0, 0,
        $!offscreen_window.width, $!offscreen_window.height
      );
      self.propagate_draw($!child, $cr_p) if $!child.defined;
    }
  }

  method to-parent ($wx, $wy, $xo is rw, $yo is rw) {
    my GtkAllocation $child_area .= new;
    my ($x, $y, $xr, $yr, $c, $s, $w, $h);

    $!child.get_allocation($child_area);
    my @wh     =  ($child_area.width, $child_area.height);
    my @hwh    =  @wh »/« (2 xx 2);
    ($s, $c)   =  ($!angle.sin, $!angle.cos);
    ($w, $h)   =  ( [+]( ($c, $s) »*« @wh ), [+]( ($s, $c) »*« @wh ) );
    ($x, $y)   =  ($wx, $wy);
    ($x, $y)   =  (($x, $y) »-« ($w, $h) »/« (2 xx 2) »-« @hwh) »-« @hwh;
    ($x, $y)   =  ($x * $c + $y * $s, $y * $c - $x * $s);
    # ...or...
    #($x, $y)   =  ( [+]( |($x, $y) »*« ($c, $s) ), [-]( |($y, $x) »*« ($c, $s) );

    ($x, $y) »-=« @hwh;
    ($xo, $yo) =  ($x, $y);
  }

  method to-child ($ox, $oy, $xo is rw, $yo is rw) {
    my GtkAllocation $child_area .= new;
    my ($x, $y, $xr, $yr, $c, $s, $w, $h);

    $!child.get_allocation($child_area);
    my @wh     =  ($child_area.width, $child_area.height);
    my @hwh    =  @wh »/« (2 xx 2);
    ($s, $c)   =  ($!angle.sin, $!angle.cos);
    ($w, $h)   =  ( [+]( ($c, $s) »*« @wh ), [+]( ($s, $c) »*« @wh ) );
    ($x, $y)   =  ($ox, $oy);
    ($x, $y) »-=« @hwh;
    ($x, $y)   =  (
      [-]( |($x, $y) »*« ($c, $s) ),
      [+]( |($x, $y) »*« ($s, $c) )
    ) + @hwh;
    ($x, $y) »-=« ($w, $h) »/« (2 xx 2) »-« @hwh;
    ($xo, $yo) =  ($x, $y);
  }

}

my $a = GTK::Application.new( title => 'org.genex.rotated-button' );

$a.activate.tap({
  my $vbox  = GTK::Box.new-vbox;
  my $scale = GTK::Scale.new_with_range(
    GTK_ORIENTATION_HORIZONTAL,
    0, π / 2,
    0.01
  );
  my $button = GTK::Button.new_with_label('A Button');
  my $bin = RotatedBin.new;

  $scale.value-changed.tap( -> *@a { $bin.set_angle($scale.value) });

  $a.window.border-width = 10;
  $scale.draw_value = False;
  $bin.add($button);
  $vbox.pack_start($scale);
  $vbox.pack_start($bin, True, True, 0);
  $a.window.add($vbox);

  $a.window.show_all;
});

$a.run;