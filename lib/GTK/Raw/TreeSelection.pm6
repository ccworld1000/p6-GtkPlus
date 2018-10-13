use v6.c;

use NativeCall;

use GTK::Compat::Types;
use GTK::Raw::Types;

unit package GTK::Raw::TreeSelection;

sub gtk_tree_selection_count_selected_rows (GtkTreeSelection $selection)
  returns gint
  is native('gtk-3')
  is export
  { * }

sub gtk_tree_selection_get_select_function (GtkTreeSelection $selection)
  returns GtkTreeSelectionFunc
  is native('gtk-3')
  is export
  { * }

sub gtk_tree_selection_get_selected (
  GtkTreeSelection $selection,
  GtkTreeModel $model,
  GtkTreeIter $iter
)
  returns uint32
  is native('gtk-3')
  is export
  { * }

sub gtk_tree_selection_get_selected_rows (
  GtkTreeSelection $selection,
  GtkTreeModel $model
)
  returns GList
  is native('gtk-3')
  is export
  { * }

sub gtk_tree_selection_get_tree_view (GtkTreeSelection $selection)
  returns GtkTreeView
  is native('gtk-3')
  is export
  { * }

sub gtk_tree_selection_get_type ()
  returns GType
  is native('gtk-3')
  is export
  { * }

sub gtk_tree_selection_get_user_data (GtkTreeSelection $selection)
  returns Pointer
  is native('gtk-3')
  is export
  { * }

sub gtk_tree_selection_iter_is_selected (
  GtkTreeSelection $selection,
  GtkTreeIter $iter
)
  returns uint32
  is native('gtk-3')
  is export
  { * }

sub gtk_tree_selection_path_is_selected (
  GtkTreeSelection $selection,
  GtkTreePath $path
)
  returns uint32
  is native('gtk-3')
  is export
  { * }

sub gtk_tree_selection_select_all (GtkTreeSelection $selection)
  is native('gtk-3')
  is export
  { * }

sub gtk_tree_selection_select_iter (
  GtkTreeSelection $selection,
  GtkTreeIter $iter
)
  is native('gtk-3')
  is export
  { * }

sub gtk_tree_selection_select_path (
  GtkTreeSelection $selection,
  GtkTreePath $path
)
  is native('gtk-3')
  is export
  { * }

sub gtk_tree_selection_select_range (
  GtkTreeSelection $selection,
  GtkTreePath $start_path,
  GtkTreePath $end_path
)
  is native('gtk-3')
  is export
  { * }

sub gtk_tree_selection_selected_foreach (
  GtkTreeSelection $selection,
  GtkTreeSelectionForeachFunc $func,
  gpointer $data
)
  is native('gtk-3')
  is export
  { * }

sub gtk_tree_selection_set_select_function (
  GtkTreeSelection $selection,
  GtkTreeSelectionFunc $func,
  gpointer $data,
  GDestroyNotify $destroy
)
  is native('gtk-3')
  is export
  { * }

sub gtk_tree_selection_unselect_all (GtkTreeSelection $selection)
  is native('gtk-3')
  is export
  { * }

sub gtk_tree_selection_unselect_iter (
  GtkTreeSelection $selection,
  GtkTreeIter $iter
)
  is native('gtk-3')
  is export
  { * }

sub gtk_tree_selection_unselect_path (
  GtkTreeSelection $selection,
  GtkTreePath $path
)
  is native('gtk-3')
  is export
  { * }

sub gtk_tree_selection_unselect_range (
  GtkTreeSelection $selection,
  GtkTreePath $start_path,
  GtkTreePath $end_path
)
  is native('gtk-3')
  is export
  { * }

sub gtk_tree_selection_get_mode (GtkTreeSelection $selection)
  returns uint32 # GtkSelectionMode
  is native('gtk-3')
  is export
  { * }

sub gtk_tree_selection_set_mode (
  GtkTreeSelection $selection,
  uint32 $type                  # GtkSelectionMode $type
)
  is native('gtk-3')
  is export
  { * }