use v6.c;

use NativeCall;

use GTK::Compat::Types;
use GTK::Raw::Types;

unit package GTK::Raw::ListStore;

sub gtk_list_store_append (GtkListStore $list_store, GtkTreeIter $iter)
  is native($LIBGTK)
  is export
  { * }

sub gtk_list_store_clear (GtkListStore $list_store)
  is native($LIBGTK)
  is export
  { * }

sub gtk_list_store_get_type ()
  returns GType
  is native($LIBGTK)
  is export
  { * }

sub gtk_list_store_insert (
  GtkListStore $list_store,
  GtkTreeIter $iter,
  gint $position
)
  is native($LIBGTK)
  is export
  { * }

sub gtk_list_store_insert_after (
  GtkListStore $list_store,
  GtkTreeIter $iter,
  GtkTreeIter $sibling
)
  is native($LIBGTK)
  is export
  { * }

sub gtk_list_store_insert_before (
  GtkListStore $list_store,
  GtkTreeIter $iter,
  GtkTreeIter $sibling
)
  is native($LIBGTK)
  is export
  { * }

sub gtk_list_store_insert_with_valuesv (
  GtkListStore $list_store,
  GtkTreeIter $iter,
  gint $position,
  CArray[gint] $columns,
  CArray[GValue] $values,
  gint $n_values
)
  is native($LIBGTK)
  is export
  { * }

sub gtk_list_store_iter_is_valid (GtkListStore $list_store, GtkTreeIter $iter)
  returns uint32
  is native($LIBGTK)
  is export
  { * }

sub gtk_list_store_move_after (
  GtkListStore $store,
  GtkTreeIter $iter,
  GtkTreeIter $position
)
  is native($LIBGTK)
  is export
  { * }

sub gtk_list_store_move_before (
  GtkListStore $store,
  GtkTreeIter $iter,
  GtkTreeIter $position
)
  is native($LIBGTK)
  is export
  { * }

sub gtk_list_store_newv (gint $n_columns, CArray[uint64] $types)
  returns GtkListStore
  is native($LIBGTK)
  is export
  { * }

sub gtk_list_store_prepend (GtkListStore $list_store, GtkTreeIter $iter)
  is native($LIBGTK)
  is export
  { * }

sub gtk_list_store_remove (GtkListStore $list_store, GtkTreeIter $iter)
  returns uint32
  is native($LIBGTK)
  is export
  { * }

sub gtk_list_store_reorder (GtkListStore $store, CArray[gint] $new_order)
  is native($LIBGTK)
  is export
  { * }

sub gtk_list_store_set_column_types (
  GtkListStore $list_store,
  gint $n_columns,
  CArray[GType] $types
)
  is native($LIBGTK)
  is export
  { * }

# sub gtk_list_store_set_valist (
#   GtkListStore $list_store,
#   GtkTreeIter $iter,
#   va_list $var_args
# )
#   is native($LIBGTK)
#   is export
#   { * }

sub gtk_list_store_set_value (
  GtkListStore $list_store,
  GtkTreeIter $iter,
  gint $column,
  GValue $value
)
  is native($LIBGTK)
  is export
  { * }

sub gtk_list_store_set_valuesv (
  GtkListStore $list_store,
  GtkTreeIter $iter,
  CArray[gint] $columns,
  CArray[GValue] $values,
  gint $n_values
)
  is native($LIBGTK)
  is export
  { * }

sub gtk_list_store_swap (
  GtkListStore $store,
  GtkTreeIter $a,
  GtkTreeIter $b
)
  is native($LIBGTK)
  is export
  { * }