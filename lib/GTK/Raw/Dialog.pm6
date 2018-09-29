use v6.c;

use NativeCall;

use GTK::Compat::Types;
use GTK::Raw::Types;

unit package GTK::Raw::Dialog;

sub gtk_dialog_add_action_widget (
  GtkDialog $dialog,
  GtkWidget $child,
  gint $response_id
)
  is native('gtk-3')
  is export
  { * }

sub gtk_dialog_add_button (
  GtkDialog $dialog,
  gchar $button_text,
  gint $response_id
)
  returns GtkWidget
  is native('gtk-3')
  is export
  { * }

sub gtk_dialog_get_action_area (GtkDialog $dialog)
  returns GtkWidget
  is native('gtk-3')
  is export
  { * }

sub gtk_dialog_get_content_area (GtkDialog $dialog)
  returns GtkWidget
  is native('gtk-3')
  is export
  { * }

sub gtk_dialog_get_header_bar (GtkDialog $dialog)
  returns GtkWidget
  is native('gtk-3')
  is export
  { * }

sub gtk_dialog_get_response_for_widget (
  GtkDialog $dialog,
  GtkWidget $widget
)
  returns gint
  is native('gtk-3')
  is export
  { * }

sub gtk_dialog_get_type ()
  returns GType
  is native('gtk-3')
  is export
  { * }

sub gtk_dialog_get_widget_for_response (
  GtkDialog $dialog,
  gint $response_id
)
  returns GtkWidget
  is native('gtk-3')
  is export
  { * }

sub gtk_alternative_dialog_button_order (GdkScreen $screen)
  returns uint32
  is native('gtk-3')
  is export
  { * }

sub gtk_dialog_new ()
  returns GtkWidget
  is native('gtk-3')
  is export
  { * }

sub gtk_dialog_response (GtkDialog $dialog, gint $response_id)
  is native('gtk-3')
  is export
  { * }

sub gtk_dialog_run (GtkDialog $dialog)
  returns gint
  is native('gtk-3')
  is export
  { * }

sub gtk_dialog_set_alternative_button_order_from_array (
  GtkDialog $dialog,
  gint $n_params,
  CArray[gint] $new_order
)
  is native('gtk-3')
  is export
  { * }

sub gtk_dialog_set_default_response (
  GtkDialog $dialog,
  gint $response_id
)
  is native('gtk-3')
  is export
  { * }

sub gtk_dialog_set_response_sensitive (
  GtkDialog $dialog,
  gint $response_id,
  gboolean $setting
)
  is native('gtk-3')
  is export
  { * }
