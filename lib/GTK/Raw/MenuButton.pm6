use v6.c;

use NativeCall;

use GTK::Compat::Types;
use GTK::Raw::Types;

unit package GTK::Raw::MenuButton;

sub gtk_menu_button_get_type ()
  returns GType
  is native($LIBGTK)
  is export
  { * }

sub gtk_menu_button_new ()
  returns GtkWidget
  is native($LIBGTK)
  is export
  { * }

sub gtk_menu_button_get_popup (GtkMenuButton $menu_button)
  returns GtkMenu
  is native($LIBGTK)
  is export
  { * }

sub gtk_menu_button_get_use_popover (GtkMenuButton $menu_button)
  returns uint32
  is native($LIBGTK)
  is export
  { * }

sub gtk_menu_button_get_direction (GtkMenuButton $menu_button)
  returns uint32 # GtkArrowType
  is native($LIBGTK)
  is export
  { * }

sub gtk_menu_button_get_popover (GtkMenuButton $menu_button)
  returns GtkPopover
  is native($LIBGTK)
  is export
  { * }

sub gtk_menu_button_get_align_widget (GtkMenuButton $menu_button)
  returns GtkWidget
  is native($LIBGTK)
  is export
  { * }

sub gtk_menu_button_get_menu_model (GtkMenuButton $menu_button)
  returns GMenuModel
  is native($LIBGTK)
  is export
  { * }

sub gtk_menu_button_set_popup (GtkMenuButton $menu_button, GtkWidget $menu)
  is native($LIBGTK)
  is export
  { * }

sub gtk_menu_button_set_use_popover (
  GtkMenuButton $menu_button,
  gboolean $use_popover
)
  is native($LIBGTK)
  is export
  { * }

sub gtk_menu_button_set_direction (
  GtkMenuButton $menu_button,
  uint32 $direction               # GtkArrowType $direction
)
  is native($LIBGTK)
  is export
  { * }

sub gtk_menu_button_set_popover (
  GtkMenuButton $menu_button,
  GtkWidget $popover
)
  is native($LIBGTK)
  is export
  { * }

sub gtk_menu_button_set_align_widget (
  GtkMenuButton $menu_button,
  GtkWidget $align_widget
)
  is native($LIBGTK)
  is export
  { * }

sub gtk_menu_button_set_menu_model (
  GtkMenuButton $menu_button,
  GMenuModel $menu_model
)
  is native($LIBGTK)
  is export
  { * }