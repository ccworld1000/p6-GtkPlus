use v6.c;

use NativeCall;

use GTK::Compat::Types;
use GTK::Raw::Types;

unit package GTK::Raw::ListBox;

sub gtk_list_box_bind_model (
  GtkListBox $box,
  GListModel $model,
  GtkListBoxCreateWidgetFunc $create_widget_func,
  gpointer $user_data,
  GDestroyNotify $user_data_free_func
)
  is native($LIBGTK)
  is export
  { * }

sub gtk_list_box_drag_highlight_row (GtkListBox $box, GtkListBoxRow $row)
  is native($LIBGTK)
  is export
  { * }

sub gtk_list_box_drag_unhighlight_row (GtkListBox $box)
  is native($LIBGTK)
  is export
  { * }

sub gtk_list_box_get_row_at_index (GtkListBox $box, gint $index)
  returns GtkListBoxRow
  is native($LIBGTK)
  is export
  { * }

sub gtk_list_box_get_row_at_y (GtkListBox $box, gint $y)
  returns GtkListBoxRow
  is native($LIBGTK)
  is export
  { * }

sub gtk_list_box_get_selected_row (GtkListBox $box)
  returns GtkListBoxRow
  is native($LIBGTK)
  is export
  { * }

sub gtk_list_box_get_selected_rows (GtkListBox $box)
  returns GList
  is native($LIBGTK)
  is export
  { * }

sub gtk_list_box_get_type ()
  returns GType
  is native($LIBGTK)
  is export
  { * }

sub gtk_list_box_insert (GtkListBox $box, GtkWidget $child, gint $position)
  is native($LIBGTK)
  is export
  { * }

sub gtk_list_box_invalidate_filter (GtkListBox $box)
  is native($LIBGTK)
  is export
  { * }

sub gtk_list_box_invalidate_headers (GtkListBox $box)
  is native($LIBGTK)
  is export
  { * }

sub gtk_list_box_invalidate_sort (GtkListBox $box)
  is native($LIBGTK)
  is export
  { * }

sub gtk_list_box_new ()
  returns GtkWidget
  is native($LIBGTK)
  is export
  { * }

sub gtk_list_box_prepend (GtkListBox $box, GtkWidget $child)
  is native($LIBGTK)
  is export
  { * }

sub gtk_list_box_row_changed (GtkListBoxRow $row)
  is native($LIBGTK)
  is export
  { * }

sub gtk_list_box_row_get_index (GtkListBoxRow $row)
  returns gint
  is native($LIBGTK)
  is export
  { * }

sub gtk_list_box_row_is_selected (GtkListBoxRow $row)
  returns uint32
  is native($LIBGTK)
  is export
  { * }

sub gtk_list_box_row_new ()
  returns GtkWidget
  is native($LIBGTK)
  is export
  { * }

sub gtk_list_box_select_all (GtkListBox $box)
  is native($LIBGTK)
  is export
  { * }

sub gtk_list_box_select_row (GtkListBox $box, GtkListBoxRow $row)
  is native($LIBGTK)
  is export
  { * }

sub gtk_list_box_selected_foreach (
  GtkListBox $box,
  GtkListBoxForeachFunc $func,
  gpointer $data
)
  is native($LIBGTK)
  is export
  { * }

sub gtk_list_box_set_filter_func (
  GtkListBox $box,
  GtkListBoxFilterFunc $filter_func,
  gpointer $user_data,
  GDestroyNotify $destroy
)
  is native($LIBGTK)
  is export
  { * }

sub gtk_list_box_set_header_func (
  GtkListBox $box,
  GtkListBoxUpdateHeaderFunc $update_header,
  gpointer $user_data,
  GDestroyNotify $destroy
)
  is native($LIBGTK)
  is export
  { * }

sub gtk_list_box_set_placeholder (GtkListBox $box, GtkWidget $placeholder)
  is native($LIBGTK)
  is export
  { * }

sub gtk_list_box_set_sort_func (
  GtkListBox $box,
  GtkListBoxSortFunc $sort_func,
  gpointer $user_data,
  GDestroyNotify $destroy
)
  is native($LIBGTK)
  is export
  { * }

sub gtk_list_box_unselect_all (GtkListBox $box)
  is native($LIBGTK)
  is export
  { * }

sub gtk_list_box_unselect_row (GtkListBox $box, GtkListBoxRow $row)
  is native($LIBGTK)
  is export
  { * }

sub gtk_list_box_get_adjustment (GtkListBox $box)
  returns GtkAdjustment
  is native($LIBGTK)
  is export
  { * }

sub gtk_list_box_row_get_header (GtkListBoxRow $row)
  returns GtkWidget
  is native($LIBGTK)
  is export
  { * }

sub gtk_list_box_row_get_activatable (GtkListBoxRow $row)
  returns uint32
  is native($LIBGTK)
  is export
  { * }

sub gtk_list_box_row_get_selectable (GtkListBoxRow $row)
  returns uint32
  is native($LIBGTK)
  is export
  { * }

sub gtk_list_box_get_selection_mode (GtkListBox $box)
  returns uint32 # GtkSelectionMode
  is native($LIBGTK)
  is export
  { * }

sub gtk_list_box_get_activate_on_single_click (GtkListBox $box)
  returns uint32
  is native($LIBGTK)
  is export
  { * }

sub gtk_list_box_set_adjustment (GtkListBox $box, GtkAdjustment $adjustment)
  is native($LIBGTK)
  is export
  { * }

sub gtk_list_box_row_set_header (GtkListBoxRow $row, GtkWidget $header)
  is native($LIBGTK)
  is export
  { * }

sub gtk_list_box_row_set_activatable (
  GtkListBoxRow $row,
  gboolean $activatable
)
  is native($LIBGTK)
  is export
  { * }

sub gtk_list_box_row_set_selectable (
  GtkListBoxRow $row,
  gboolean $selectable
)
  is native($LIBGTK)
  is export
  { * }

sub gtk_list_box_set_selection_mode (
  GtkListBox $box,
  uint32 $mode                  # GtkSelectionMode $mode
)
  is native($LIBGTK)
  is export
  { * }

sub gtk_list_box_set_activate_on_single_click (
  GtkListBox $box,
  gboolean $single
)
  is native($LIBGTK)
  is export
  { * }