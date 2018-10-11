use v6.c;

use NativeCall;

use GTK::Compat::Types;
use GTK::Raw::CellAreaBox;
use GTK::Raw::Types;

use GTK::CellArea;

use GTK::Roles::Orientable;

class GTK::CellAreaBox is GTK::CellArea {
  also does GTK::Roles::Orientable;

  has GtkCellAreaBox $!cab;

  method bless(*%attrinit) {
    my $o = self.CREATE.BUILDALL(Empty, %attrinit);
    $o.setType('GTK::CellAreaBox');
    $o;
  }

  submethod BUILD(:$cellbox) {
    my $to-parent;
    given $cellbox {
      when GtkCellAreaBox | GtkWidget {
        $!cab = do {
          when GtkWidget {
            $to-parent = $_;
            nativecast(GtkCellAreaBox, $_);
          }
          when GtkCellAreaBox  {
            $to-parent = nativecast(GtkCellArea, $_);
            $_;
          }
        }
        self.setCellArea($to-parent);
      }
      when GTK::CellAreaBox {
      }
      default {
      }
    }
    # For GTK::Roles::Orientable
    $!or = nativecast(GtkOrientable, $!cab);
  }

  method GTK::Raw::Types::GtkCellArea {
    $!cab;
  }

  # ↓↓↓↓ SIGNALS ↓↓↓↓
  # ↑↑↑↑ SIGNALS ↑↑↑↑

  # ↓↓↓↓ ATTRIBUTES ↓↓↓↓
  method spacing is rw {
    Proxy.new(
      FETCH => sub ($) {
        gtk_cell_area_box_get_spacing($!cab);
      },
      STORE => sub ($, Int() $spacing is copy) {
        my gint $s = self.RESOLVE-INT($spacing);
        gtk_cell_area_box_set_spacing($!cab, $spacing);
      }
    );
  }
  # ↑↑↑↑ ATTRIBUTES ↑↑↑↑

  # ↓↓↓↓ METHODS ↓↓↓↓
  method get_type {
    gtk_cell_area_box_get_type();
  }

  method new {
    my $cellbox = gtk_cell_area_box_new();
    self.bless(:$cellbox);
  }

  method pack_end (
    GtkCellRenderer() $renderer,
    gboolean $expand,
    gboolean $align,
    gboolean $fixed
  ) {
    gtk_cell_area_box_pack_end($!cab, $renderer, $expand, $align, $fixed);
  }

  method pack_start (
    GtkCellRenderer() $renderer,
    gboolean $expand,
    gboolean $align,
    gboolean $fixed
  ) {
    gtk_cell_area_box_pack_start($!cab, $renderer, $expand, $align, $fixed);
  }

  # ↑↑↑↑ METHODS ↑↑↑↑

}