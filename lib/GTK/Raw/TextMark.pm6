use v6.c;

use NativeCall;

use GTK::Compat::Types;
use GTK::Raw::Types;

unit package GTK::Raw::TextMark;

sub gtk_text_mark_get_buffer (GtkTextMark $mark)
  returns GtkTextBuffer
  is native($LIBGTK)
  is export
  { * }

sub gtk_text_mark_get_deleted (GtkTextMark $mark)
  returns uint32
  is native($LIBGTK)
  is export
  { * }

sub gtk_text_mark_get_left_gravity (GtkTextMark $mark)
  returns uint32
  is native($LIBGTK)
  is export
  { * }

sub gtk_text_mark_get_name (GtkTextMark $mark)
  returns Str
  is native($LIBGTK)
  is export
  { * }

sub gtk_text_mark_get_type ()
  returns GType
  is native($LIBGTK)
  is export
  { * }

sub gtk_text_mark_new (gchar $name, gboolean $left_gravity)
  returns GtkTextMark
  is native($LIBGTK)
  is export
  { * }

sub gtk_text_mark_get_visible (GtkTextMark $mark)
  returns uint32
  is native($LIBGTK)
  is export
  { * }

sub gtk_text_mark_set_visible (GtkTextMark $mark, gboolean $setting)
  is native($LIBGTK)
  is export
  { * }