use v6.c;

use NativeCall;

use GTK::Compat::Types;
use GTK::Raw::Popover;
use GTK::Raw::Types;

use GTK::Bin;

class GTK::Popover is GTK::Bin {
  has GtkPopover $!p;

  method bless(*%attrinit) {
    my $o = self.CREATE.BUILDALL(Empty, %attrinit);
    $o.setType('GTK::Popover');
    $o;
  }

  submethod BUILD(:$popover) {
    given $popover {
      when GtkPopover | GtkWidget {
        self.setPopover($popover);
      }
      when GTK::Popover {
      }
      default {
      }
    }
  }

  method setPopover($popover) {
    my $to-parent;
    $!p = do given $popover {
      when GtkWidget {
        $to-parent = $_;
        nativecast(GtkPopover, $_);
      }
      when GtkPopover {
        $to-parent = nativecast(GtkBin, $_);
        $_;
      }
    }
    self.setBin($to-parent);
  }

  method new (GtkWidget $popover) {
    self.bless(:$popover);
  }

  method new-relative-to(GtkWidget() $relative) {
    my $popover = gtk_popover_new($relative);
    self.bless(:$popover);
  }

  method new_from_model (GtkWidget() $relative, GMenuModel $model) {
    my $popover = gtk_popover_new_from_model($relative, $model);
    self.bless(:$popover);
  }

  # ↓↓↓↓ SIGNALS ↓↓↓↓

  # Is originally:
  # GtkPopover, gpointer --> void
  method closed {
    self.connect($!p, 'closed');
  }
  # ↑↑↑↑ SIGNALS ↑↑↑↑

  # ↓↓↓↓ ATTRIBUTES ↓↓↓↓
  method constrain_to is rw {
    Proxy.new(
      FETCH => sub ($) {
        GtkPopoverConstraint( gtk_popover_get_constrain_to($!p) );
      },
      STORE => sub ($, Int() $constraint is copy) {
        my uint32 $c = self.RESOLVE-UINT($constraint);
        gtk_popover_set_constrain_to($!p, $c);
      }
    );
  }

  method default_widget is rw {
    Proxy.new(
      FETCH => sub ($) {
        gtk_popover_get_default_widget($!p);
      },
      STORE => sub ($, GtkWidget() $widget is copy) {
        gtk_popover_set_default_widget($!p, $widget);
      }
    );
  }

  method modal is rw {
    Proxy.new(
      FETCH => sub ($) {
        so gtk_popover_get_modal($!p);
      },
      STORE => sub ($, Int() $modal is copy) {
        my gboolean $m = self.RESOLVE-BOOL($modal);
        gtk_popover_set_modal($!p, $m);
      }
    );
  }

  method position is rw {
    Proxy.new(
      FETCH => sub ($) {
        GtkPositionType( gtk_popover_get_position($!p) );
      },
      STORE => sub ($, Int() $position is copy) {
        my uint32 $p = self.RESOLVE-UINT($position);
        gtk_popover_set_position($!p, $p);
      }
    );
  }

  method relative_to is rw {
    Proxy.new(
      FETCH => sub ($) {
        gtk_popover_get_relative_to($!p);
      },
      STORE => sub ($, GtkWidget() $relative_to is copy) {
        gtk_popover_set_relative_to($!p, $relative_to);
      }
    );
  }

  method transitions_enabled is rw {
    Proxy.new(
      FETCH => sub ($) {
        so gtk_popover_get_transitions_enabled($!p);
      },
      STORE => sub ($, Int() $transitions_enabled is copy) {
        my gboolean $te = self.RESOLVE-BOOL($transitions_enabled);
        gtk_popover_set_transitions_enabled($!p, $te);
      }
    );
  }
  # ↑↑↑↑ ATTRIBUTES ↑↑↑↑

  # ↓↓↓↓ METHODS ↓↓↓↓
  method bind_model (GMenuModel $model, gchar $action_namespace) {
    gtk_popover_bind_model($!p, $model, $action_namespace);
  }

  method get_pointing_to (GdkRectangle() $rect) {
    gtk_popover_get_pointing_to($!p, $rect);
  }

  method get_type {
    gtk_popover_get_type();
  }

  method popdown {
    gtk_popover_popdown($!p);
  }

  method popup {
    gtk_popover_popup($!p);
  }

  method set_pointing_to (GdkRectangle() $rect) {
    gtk_popover_set_pointing_to($!p, $rect);
  }
  # ↑↑↑↑ METHODS ↑↑↑↑

}
