use v6.c;

use NativeCall;

use GTK::Compat::Types;
use GTK::Raw::TreeStore;
use GTK::Raw::Types;

use GTK::Roles::Buildable;
use GTK::Roles::TreeDnD;
use GTK::Roles::TreeModel;
use GTK::Roles::TreeSortable;

class GTK::TreeStore  {
  also does GTK::Roles::Buildable;
  also does GTK::Roles::TreeDragDest;
  also does GTK::Roles::TreeDragSource;
  also does GTK::Roles::TreeModel;
  also does GTK::Roles::TreeSortable;

  has GtkTreeStore $!tree;

  submethod BUILD(:$treestore) {
    $!tree = $treestore;
    $!b  = nativecast(GtkBuildable,      $!tree);  # GTK::Roles::Buildable
    $!tm = nativecast(GtkTreeModel,      $!tree);  # GTK::Roles::TreeModel
    $!ts = nativecast(GtkTreeSortable,   $!tree);  # GTK::Roles::TreeSortable
    $!dd = nativecast(GtkTreeDragDest,   $!tree);  # GTK::Roles::TreeDragDest
    $!ds = nativecast(GtkTreeDragSource, $!tree);  # GTK::Roles::TreeDragSource
  }

  method new (GType @types) {
    my $t = CArray[GType].new;
    $t[$++] = $_ for @types;
    my gint $c = @types.elems;
    my $treestore = gtk_tree_store_newv($c, $t);
    self.bless(:$treestore);
  }

  method !checkCV(@columns, @values) {
    die 'Contents of @columns must be integers.'
      unless @columns.all ~~ (Int, IntStr).any;
    warn '@columns exceeds the number of @values'
      if +@columns > +@values;
    warn '@values exceeds the number of @columns'
      if +@values > +@columns;
    my $max = max(+@columns, +@values);

    my $c = CArray[int32].new(@columns[^$max]);
    my $v = CArray[GValue].new;
    for (^$max) {
      $v[$_] = do given @values[$_] {
        # NOTE! $_ is now the current element of @value
        when GValue { $_ }
        default     { $_.GValue }
      }
    }
    ($c, $v);
  }

  # ↓↓↓↓ SIGNALS ↓↓↓↓
  # ↑↑↑↑ SIGNALS ↑↑↑↑

  # ↓↓↓↓ ATTRIBUTES ↓↓↓↓
  # ↑↑↑↑ ATTRIBUTES ↑↑↑↑

  # ↓↓↓↓ PROPERTIES ↓↓↓↓
  # ↑↑↑↑ PROPERTIES ↑↑↑↑

  # ↓↓↓↓ METHODS ↓↓↓↓
  method append (GtkTreeIter() $iter, GtkTreeIter() $parent) {
    gtk_tree_store_append($!tree, $iter, $parent);
  }

  method clear {
    gtk_tree_store_clear($!tree);
  }

  method get_type {
    gtk_tree_store_get_type();
  }

  method insert (
    GtkTreeIter() $iter,
    GtkTreeIter() $parent,
    Int() $position
  ) {
    my gint $p = self.RESOLVE-INT($position);
    gtk_tree_store_insert($!tree, $iter, $parent, $p);
  }

  method insert_after (
    GtkTreeIter() $iter,
    GtkTreeIter() $parent,
    GtkTreeIter() $sibling
  ) {
    gtk_tree_store_insert_after($!tree, $iter, $parent, $sibling);
  }

  method insert_before (
    GtkTreeIter() $iter,
    GtkTreeIter() $parent,
    GtkTreeIter() $sibling
  ) {
    gtk_tree_store_insert_before($!tree, $iter, $parent, $sibling);
  }

  method insert_with_values(
    GtkTreeIter() $iter,
    GtkTreeIter() $pt, # parent
    Int() $position,
    %values
  ) {
    my @c = %values.keys.map( *.Int ).sort;
    my @v;
    @v.push(%values{$_}) for @c;
    self.insert_with_valuesv($iter, $pt, $position, @c, @v)
  }

  method insert_with_valuesv (
    GtkTreeIter $iter,
    GtkTreeIter $pt, # parent
    Int() $position,
    @columns,
    @values,
  ) {
    my ($c, $v) = self!checkCV(@columns, @values);
    my gint $p = self.RESOLVE-INT($position);
    gtk_tree_store_insert_with_valuesv($!tree, $iter, $pt, $p, $c, $v, $c.elems);
  }

  method is_ancestor (
    GtkTreeIter() $iter,
    GtkTreeIter() $descendant
  ) {
    gtk_tree_store_is_ancestor($!tree, $iter, $descendant);
  }

  method iter_depth (GtkTreeIter() $iter) {
    gtk_tree_store_iter_depth($!tree, $iter);
  }

  method iter_is_valid (GtkTreeIter() $iter) {
    gtk_tree_store_iter_is_valid($!tree, $iter);
  }

  method move_after (
    GtkTreeIter() $iter,
    GtkTreeIter() $position
  ) {
    gtk_tree_store_move_after($!tree, $iter, $position);
  }

  method move_before (
    GtkTreeIter() $iter,
    GtkTreeIter() $position
  ) {
    gtk_tree_store_move_before($!tree, $iter, $position);
  }

  method prepend (
    GtkTreeIter() $iter,
    GtkTreeIter() $parent
  ) {
    gtk_tree_store_prepend($!tree, $iter, $parent);
  }

  method remove (GtkTreeIter() $iter) {
    gtk_tree_store_remove($!tree, $iter);
  }

  method reorder (GtkTreeIter() $parent, @new_order) {
    die '@new_order must consist of integers'
      unless @new_order.all ~~ (Int, IntStr).any;
    my $no = CArray[int32].new( @new_order.map( *.Int ) );
    gtk_tree_store_reorder($!tree, $parent, $no);
  }

  method set_column_types (*@types) {
    die '@types must consist of integers'
      unless @types.all ~~ (Int, IntStr).any;
    my $t = CArray[uint64].new( @types.map( *.Int ) );
    gtk_tree_store_set_column_types($!tree, $t.elems, $t);
  }

  # method set_valist (GtkTreeIter $iter, va_list $var_args) {
  #   gtk_tree_store_set_valist($!tree, $iter, $var_args);
  # }

  method set_value (GtkTreeIter() $iter, Int() $column, GValue() $value) {
    my gint $c = self.RESOLVE-INT($column);
    gtk_tree_store_set_value($!tree, $iter, $c, $value);
  }

  method set_values(GtkTreeIter() $iter, %values) {
    my @c = %values.keys.map( *.Int ).sort;
    my @v;
    @v.push(%values{$_}) for @c;
    self.set_valuesv($iter, @c, @v);
  }

  method set_valuesv (
    GtkTreeIter() $iter,
    @columns,
    @values,
  ) {
    my ($c, $v) = self!checkCV(@columns, @values);
    gtk_tree_store_set_valuesv($!tree, $iter, $c, $v, $c.elems);
  }

  method swap (
    GtkTreeIter() $a,
    GtkTreeIter() $b
  ) {
    gtk_tree_store_swap($!tree, $a, $b);
  }
  # ↑↑↑↑ METHODS ↑↑↑↑

}