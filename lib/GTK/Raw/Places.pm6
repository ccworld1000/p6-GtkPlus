use v6.c;

use NativeCall;

use GTK::Compat::Types;
use GTK::Raw::Types;

unit package GTK::Raw::Places;

sub gtk_places_sidebar_add_shortcut (
  GtkPlacesSidebar $sidebar,
  GFile $location
)
  is native($LIBGTK)
  is export
  { * }

sub gtk_places_sidebar_get_nth_bookmark (
  GtkPlacesSidebar $sidebar,
  gint $n
)
  returns GFile
  is native($LIBGTK)
  is export
  { * }

sub gtk_places_sidebar_get_type ()
  returns GType
  is native($LIBGTK)
  is export
  { * }

sub gtk_places_sidebar_list_shortcuts (GtkPlacesSidebar $sidebar)
  returns GSList
  is native($LIBGTK)
  is export
  { * }

sub gtk_places_sidebar_new ()
  returns GtkWidget
  is native($LIBGTK)
  is export
  { * }

sub gtk_places_sidebar_remove_shortcut (
  GtkPlacesSidebar $sidebar,
  GFile $location
)
  is native($LIBGTK)
  is export
  { * }

sub gtk_places_sidebar_set_drop_targets_visible (
  GtkPlacesSidebar $sidebar,
  gboolean $visible,
  GdkDragContext $context
)
  is native($LIBGTK)
  is export
  { * }

sub gtk_places_sidebar_get_open_flags (GtkPlacesSidebar $sidebar)
  returns uint32 # GtkPlacesOpenFlags
  is native($LIBGTK)
  is export
  { * }

sub gtk_places_sidebar_get_show_desktop (GtkPlacesSidebar $sidebar)
  returns uint32
  is native($LIBGTK)
  is export
  { * }

sub gtk_places_sidebar_get_show_other_locations (GtkPlacesSidebar $sidebar)
  returns uint32
  is native($LIBGTK)
  is export
  { * }

sub gtk_places_sidebar_get_local_only (GtkPlacesSidebar $sidebar)
  returns uint32
  is native($LIBGTK)
  is export
  { * }

sub gtk_places_sidebar_get_show_recent (GtkPlacesSidebar $sidebar)
  returns uint32
  is native($LIBGTK)
  is export
  { * }

sub gtk_places_sidebar_get_location (GtkPlacesSidebar $sidebar)
  returns GFile
  is native($LIBGTK)
  is export
  { * }

sub gtk_places_sidebar_get_show_enter_location (GtkPlacesSidebar $sidebar)
  returns uint32
  is native($LIBGTK)
  is export
  { * }

sub gtk_places_sidebar_get_show_starred_location (GtkPlacesSidebar $sidebar)
  returns uint32
  is native($LIBGTK)
  is export
  { * }

sub gtk_places_sidebar_get_show_connect_to_server (GtkPlacesSidebar $sidebar)
  returns uint32
  is native($LIBGTK)
  is export
  { * }

sub gtk_places_sidebar_get_show_trash (GtkPlacesSidebar $sidebar)
  returns uint32
  is native($LIBGTK)
  is export
  { * }

sub gtk_places_sidebar_set_open_flags (
  GtkPlacesSidebar $sidebar,
  uint32 $flags                   # GtkPlacesOpenFlags $flags
)
  is native($LIBGTK)
  is export
  { * }

sub gtk_places_sidebar_set_show_desktop (
  GtkPlacesSidebar $sidebar,
  gboolean $show_desktop
)
  is native($LIBGTK)
  is export
  { * }

sub gtk_places_sidebar_set_show_other_locations (
  GtkPlacesSidebar $sidebar,
  gboolean $show_other_locations
)
  is native($LIBGTK)
  is export
  { * }

sub gtk_places_sidebar_set_local_only (
  GtkPlacesSidebar $sidebar,
  gboolean $local_only
)
  is native($LIBGTK)
  is export
  { * }

sub gtk_places_sidebar_set_show_recent (
  GtkPlacesSidebar $sidebar,
  gboolean $show_recent
)
  is native($LIBGTK)
  is export
  { * }

sub gtk_places_sidebar_set_location (
  GtkPlacesSidebar $sidebar,
  GFile $location
)
  is native($LIBGTK)
  is export
  { * }

sub gtk_places_sidebar_set_show_enter_location (
  GtkPlacesSidebar $sidebar,
  gboolean $show_enter_location
)
  is native($LIBGTK)
  is export
  { * }

sub gtk_places_sidebar_set_show_starred_location (
  GtkPlacesSidebar $sidebar,
  gboolean $show_starred_location
)
  is native($LIBGTK)
  is export
  { * }

sub gtk_places_sidebar_set_show_connect_to_server (
  GtkPlacesSidebar $sidebar,
  gboolean $show_connect_to_server
)
  is native($LIBGTK)
  is export
  { * }

sub gtk_places_sidebar_set_show_trash (
  GtkPlacesSidebar $sidebar,
  gboolean $show_trash
)
  is native($LIBGTK)
  is export
  { * }