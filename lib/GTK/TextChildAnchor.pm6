use v6.c;

use NativeCall;

use GTK::Compat::Types;
use GTK::Raw::TextChildAnchor;
use GTK::Raw::Types;

class GTK::TextChildAnchor {
  has GtkTextChildAnchor $!ta;

  submethod BUILD(:$anchor) {
    $!ta = $anchor;
  }

  method new {
    my $anchor = gtk_text_child_anchor_new();
    self.bless(:$anchor);
  }

  method GTK::Raw::Types::GtkTextChildAnchor {
    $!ta;
  }

  # ↓↓↓↓ SIGNALS ↓↓↓↓
  # ↑↑↑↑ SIGNALS ↑↑↑↑

  # ↓↓↓↓ ATTRIBUTES ↓↓↓↓
  # ↑↑↑↑ ATTRIBUTES ↑↑↑↑

  # ↓↓↓↓ PROPERTIES ↓↓↓↓
  # ↑↑↑↑ PROPERTIES ↑↑↑↑

  # ↓↓↓↓ METHODS ↓↓↓↓
  method get_deleted {
    gtk_text_child_anchor_get_deleted($!ta);
  }

  method get_type {
    gtk_text_child_anchor_get_type();
  }

  # Create a new GTK::Compat::GList when working.
  method get_widgets {
    gtk_text_child_anchor_get_widgets($!ta);
  }
  # ↑↑↑↑ METHODS ↑↑↑↑

}
