use v6.c;

use NativeCall;

use GTK::Compat::Types;
use GTK::Raw::Types;

unit package GTK::Raw::FileChooser;

sub gtk_file_chooser_button_get_type ()
returns GType
is native('gtk-3')
is export
{ * }

sub gtk_file_chooser_button_new (gchar $title, GtkFileChooserAction $action)
returns GtkWidget
is native('gtk-3')
is export
{ * }

sub gtk_file_chooser_button_new_with_dialog (GtkWidget $dialog)
returns GtkWidget
is native('gtk-3')
is export
{ * }

sub gtk_file_chooser_button_get_width_chars (GtkFileChooserButton $button)
returns gint
is native('gtk-3')
is export
{ * }

sub gtk_file_chooser_button_get_focus_on_click (GtkFileChooserButton $button)
returns uint32
is native('gtk-3')
is export
{ * }

sub gtk_file_chooser_button_get_title (GtkFileChooserButton $button)
returns Str
is native('gtk-3')
is export
{ * }

sub gtk_file_chooser_button_set_width_chars (GtkFileChooserButton $button, gint $n_chars)
is native('gtk-3')
is export
{ * }

sub gtk_file_chooser_button_set_focus_on_click (GtkFileChooserButton $button, gboolean $focus_on_click)
is native('gtk-3')
is export
{ * }

sub gtk_file_chooser_button_set_title (GtkFileChooserButton $button, gchar $title)
is native('gtk-3')
is export
{ * }