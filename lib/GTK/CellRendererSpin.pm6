use v6.c;

use NativeCall;

use GTK::Compat::Types;
use GTK::Raw::CellRendererSpin;
use GTK::Raw::Types;

use GTK::Adjustment;
use GTK::CellRendererText;

class GTK::CellRendererSpin is GTK::CellRendererText {
  has GtkCellRendererSpin $!crs;

  method bless(*%attrinit) {
    my $o = self.CREATE.BUILDALL(Empty, %attrinit);
    $o.setType('GTK::CellRendererSpin');
    $o;
  }

  submethod BUILD(:$cellspin) {
    my $to-parent;
    given $cellspin {
      when GtkCellRendererSpin | GtkCellRenderer {
        $!crs = do {
          when GtkCellRenderer {
            $to-parent = $_;
            nativecast(GtkCellRendererSpin, $_);
          }
          when GtkCellRendererSpin {
            $to-parent = nativecast(GtkCellRenderer, $_);
            $_;
          }
        }
        self.setCellRendererText($to-parent);
      }
      when GTK::CellRendererSpin {
      }
      default {
      }
    }
  }

  method GTK::Raw::Types::GtkCellRendererSpin {
    $!crs;
  }

  multi method new {
    my $cellspin = gtk_cell_renderer_spin_new();
    self.bless(:$cellspin);
  }
  multi method new (GtkCellRendererCombo $cellspin) {
    self.bless(:$cellspin);
  }
  multi method new (GtkCellRenderer $cellspin) {
    self.bless(:$cellspin);
  }

  # ↓↓↓↓ SIGNALS ↓↓↓↓
  # ↑↑↑↑ SIGNALS ↑↑↑↑

  # ↓↓↓↓ ATTRIBUTES ↓↓↓↓
  # ↑↑↑↑ ATTRIBUTES ↑↑↑↑

  # ↓↓↓↓ PROPERTIES ↓↓↓↓

  # Type: GtkAdjustment
  method adjustment is rw {
    my GTK::Compat::Value $gv .= new( G_TYPE_POINTER );
    Proxy.new(
      FETCH => -> $ {
        $gv = GTK::Compat::Value.new( self.prop_get($!crs, 'adjustment', $gv); );
        GTK::Adjustment.new( nativecast(GtkAdjustment, $gv.pointer ) );
      },
      STORE => -> $, GtkAdjustment() $val is copy {
        $gv.pointer = $val;
        self.prop_set($!crs, 'adjustment', $gv);
      }
    );
  }

  # Type: gdouble
  method climb-rate is rw {
    my GTK::Compat::Value $gv .= new( G_TYPE_DOUBLE );
    Proxy.new(
      FETCH => -> $ {
        $gv = GTK::Compat::Value.new( self.prop_get($!crs, 'climb-rate', $gv); );
        $gv.double;
      },
      STORE => -> $, Num() $val is copy {
        $gv.double = $val;
        self.prop_set($!crs, 'climb-rate', $gv);
      }
    );
  }

  # Type: guint
  method digits is rw {
    my GTK::Compat::Value $gv .= new( G_TYPE_UINT );
    Proxy.new(
      FETCH => -> $ {
        $gv = GTK::Compat::Value.new( self.prop_get($!crs, 'digits', $gv); );
        $gv.uint;
      },
      STORE => -> $, Int() $val is copy {
        $gv.uint = self.RESOLVE-UINT($val);
        self.prop_set($!crs, 'digits', $gv);
      }
    );
  }

  # ↑↑↑↑ PROPERTIES ↑↑↑↑

  # ↓↓↓↓ METHODS ↓↓↓↓
  method get_type {
    gtk_cell_renderer_spin_get_type();
  }
  # ↑↑↑↑ METHODS ↑↑↑↑

}
