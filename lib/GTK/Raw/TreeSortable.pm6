use v6.c;

use NativeCall;

use GTK::Compat::Types;
use GTK::Raw::Types;

unit package GTK::Raw::TreeSortable;

sub gtk_tree_sortable_get_sort_column_id (
  GtkTreeSortable $sortable,
  gint $sort_column_id,
  guint $order                  # GtkSortType $order
)
  returns uint32
  is native($LIBGTK)
  is export
  { * }

sub gtk_tree_sortable_get_type ()
  returns GType
  is native($LIBGTK)
  is export
  { * }

sub gtk_tree_sortable_has_default_sort_func (GtkTreeSortable $sortable)
  returns uint32
  is native($LIBGTK)
  is export
  { * }

sub gtk_tree_sortable_set_default_sort_func (
  GtkTreeSortable $sortable,
  &function (GtkTreeModel, GtkTreeIter, GtkTreeIter, gpointer --> gint),
  gpointer $user_data,
  GDestroyNotify $destroy
)
  is native($LIBGTK)
  is export
  { * }

sub gtk_tree_sortable_set_sort_column_id (
  GtkTreeSortable $sortable,
  gint $sort_column_id,
  uint32 $order                 # GtkSortType $order
)
  is native($LIBGTK)
  is export
  { * }

sub gtk_tree_sortable_set_sort_func (
  GtkTreeSortable $sortable,
  gint $sort_column_id,
  GtkTreeIterCompareFunc $sort_func,
  gpointer $user_data,
  GDestroyNotify $destroy
)
  is native($LIBGTK)
  is export
  { * }

sub gtk_tree_sortable_sort_column_changed (GtkTreeSortable $sortable)
  is native($LIBGTK)
  is export
  { * }