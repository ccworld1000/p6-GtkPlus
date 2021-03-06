use v6.c;

use NativeCall;

use GTK::Compat::GSList;
use GTK::Compat::Types;
use GTK::Raw::TextIter;
use GTK::Raw::Types;

class GTK::TextIter {
  also does GTK::Roles::Types;

  has GtkTextIter $!ti;

  method bless(*%attrinit) {
    use nqp;
    my $o = nqp::create(self).BUILDALL(Empty, %attrinit);
    # Non-widget descendent does not have setType.
    #$o.setType('GTK::TextIter');
    $o;
  }

  submethod BUILD(:$textiter) {
   $!ti = $textiter
  }

  multi method new {
    my $textiter = GtkTextIter.new;
    self.bless(:$textiter);
  }
  multi method new(GtkTextIter $textiter) {
    self.bless(:$textiter);
  }

  method GTK::Raw::Types::GtkTextIter {
    $!ti;
  }

  # ↓↓↓↓ SIGNALS ↓↓↓↓
  # ↑↑↑↑ SIGNALS ↑↑↑↑

  # ↓↓↓↓ ATTRIBUTES ↓↓↓↓
  method line is rw {
    Proxy.new(
      FETCH => sub ($) {
        gtk_text_iter_get_line($!ti);
      },
      STORE => sub ($, Int() $line_number is copy) {
        my gint $ln = self.RESOLVE-INT($line_number);
        gtk_text_iter_set_line($!ti, $ln);
      }
    );
  }

  method line_index is rw {
    Proxy.new(
      FETCH => sub ($) {
        gtk_text_iter_get_line_index($!ti);
      },
      STORE => sub ($, Int() $byte_on_line is copy) {
        my gint $b = self.RESOLVE-INT($byte_on_line);
        gtk_text_iter_set_line_index($!ti, $b);
      }
    );
  }

  method line_offset is rw {
    Proxy.new(
      FETCH => sub ($) {
        gtk_text_iter_get_line_offset($!ti);
      },
      STORE => sub ($, int() $char_on_line is copy) {
        my gint $c = self.RESOLVE-INT($char_on_line);
        gtk_text_iter_set_line_offset($!ti, $c);
      }
    );
  }

  method offset is rw {
    Proxy.new(
      FETCH => sub ($) {
        gtk_text_iter_get_offset($!ti);
      },
      STORE => sub ($, Int() $char_offset is copy) {
        my gint $c = self.RESOLVE-INT($char_offset);
        gtk_text_iter_set_offset($!ti, $c);
      }
    );
  }

  method visible_line_index is rw {
    Proxy.new(
      FETCH => sub ($) {
        gtk_text_iter_get_visible_line_index($!ti);
      },
      STORE => sub ($, Int() $byte_on_line is copy) {
        my gint $b = self.RESOLVE-INT($byte_on_line);
        gtk_text_iter_set_visible_line_index($!ti, $b);
      }
    );
  }

  method visible_line_offset is rw {
    Proxy.new(
      FETCH => sub ($) {
        gtk_text_iter_get_visible_line_offset($!ti);
      },
      STORE => sub ($, Int() $char_on_line is copy) {
        my gint $c = self.RESOLVE-INT($char_on_line);
        gtk_text_iter_set_visible_line_offset($!ti, $c);
      }
    );
  }
  # ↑↑↑↑ ATTRIBUTES ↑↑↑↑

  # ↓↓↓↓ METHODS ↓↓↓↓
  method assign (GtkTextIter() $other) {
    gtk_text_iter_assign($!ti, $other);
  }

  method backward_char {
    so gtk_text_iter_backward_char($!ti);
  }

  method backward_chars (gint $count) {
    so gtk_text_iter_backward_chars($!ti, $count);
  }

  method backward_cursor_position {
    so gtk_text_iter_backward_cursor_position($!ti);
  }

  method backward_cursor_positions (gint $count) {
    so gtk_text_iter_backward_cursor_positions($!ti, $count);
  }

  method backward_find_char (
    GtkTextCharPredicate $pred,
    gpointer $user_data,
    GtkTextIter() $limit
  ) {
    so gtk_text_iter_backward_find_char(
      $!ti,
      $pred,
      $user_data,
      $limit
    );
  }

  method backward_line {
    so gtk_text_iter_backward_line($!ti);
  }

  method backward_lines (gint $count) {
    so gtk_text_iter_backward_lines($!ti, $count);
  }

  method backward_search (
    gchar $str,
    GtkTextSearchFlags $flags,
    GtkTextIter() $match_start,
    GtkTextIter() $match_end,
    GtkTextIter() $limit
  ) {
    so gtk_text_iter_backward_search(
      $!ti,
      $str,
      $flags,
      $match_start,
      $match_end,
      $limit
    );
  }

  method backward_sentence_start {
    so gtk_text_iter_backward_sentence_start($!ti);
  }

  method backward_sentence_starts (gint $count) {
    so gtk_text_iter_backward_sentence_starts($!ti, $count);
  }

  method backward_to_tag_toggle (GtkTextTag() $tag) {
    so gtk_text_iter_backward_to_tag_toggle($!ti, $tag);
  }

  method backward_visible_cursor_position () {
    so gtk_text_iter_backward_visible_cursor_position($!ti);
  }

  method backward_visible_cursor_positions (gint $count) {
    so gtk_text_iter_backward_visible_cursor_positions($!ti, $count);
  }

  method backward_visible_line {
    so gtk_text_iter_backward_visible_line($!ti);
  }

  method backward_visible_lines (gint $count) {
    so gtk_text_iter_backward_visible_lines($!ti, $count);
  }

  method backward_visible_word_start {
    so gtk_text_iter_backward_visible_word_start($!ti);
  }

  method backward_visible_word_starts (gint $count) {
    so gtk_text_iter_backward_visible_word_starts($!ti, $count);
  }

  method backward_word_start {
    so gtk_text_iter_backward_word_start($!ti);
  }

  method backward_word_starts (gint $count) {
    so gtk_text_iter_backward_word_starts($!ti, $count);
  }

  method begins_tag (GtkTextTag() $tag) {
    so gtk_text_iter_begins_tag($!ti, $tag);
  }

  method can_insert (gboolean $default_editability) {
    so gtk_text_iter_can_insert($!ti, $default_editability);
  }

  method compare (GtkTextIter() $rhs) {
    gtk_text_iter_compare($!ti, $rhs);
  }

  method copy {
    GTK::TextIter.new( gtk_text_iter_copy($!ti) );
  }

  method editable (gboolean $default_setting) {
    so gtk_text_iter_editable($!ti, $default_setting);
  }

  method ends_line {
    so gtk_text_iter_ends_line($!ti);
  }

  method ends_sentence {
    so gtk_text_iter_ends_sentence($!ti);
  }

  method ends_tag (GtkTextTag() $tag) {
    so gtk_text_iter_ends_tag($!ti, $tag);
  }

  method ends_word {
    so gtk_text_iter_ends_word($!ti);
  }

  method equal (GtkTextIter() $rhs) {
    so gtk_text_iter_equal($!ti, $rhs);
  }

  method forward_char {
    so gtk_text_iter_forward_char($!ti);
  }

  method forward_chars (gint $count) {
    so gtk_text_iter_forward_chars($!ti, $count);
  }

  method forward_cursor_position {
    so gtk_text_iter_forward_cursor_position($!ti);
  }

  method forward_cursor_positions (gint $count) {
    so gtk_text_iter_forward_cursor_positions($!ti, $count);
  }

  method forward_find_char (
    GtkTextCharPredicate $pred,
    gpointer $user_data,
    GtkTextIter() $limit
  ) {
    so gtk_text_iter_forward_find_char($!ti, $pred, $user_data, $limit);
  }

  method forward_line {
    so gtk_text_iter_forward_line($!ti);
  }

  method forward_lines (gint $count) {
    so gtk_text_iter_forward_lines($!ti, $count);
  }

  method forward_search (
    gchar $str,
    GtkTextSearchFlags $flags,
    GtkTextIter() $match_start,
    GtkTextIter() $match_end,
    GtkTextIter() $limit
  ) {
    so gtk_text_iter_forward_search(
      $!ti,
      $str,
      $flags,
      $match_start,
      $match_end,
      $limit
    );
  }

  method forward_sentence_end {
    so gtk_text_iter_forward_sentence_end($!ti);
  }

  method forward_sentence_ends (gint $count) {
    so gtk_text_iter_forward_sentence_ends($!ti, $count);
  }

  method forward_to_end () {
    so gtk_text_iter_forward_to_end($!ti);
  }

  method forward_to_line_end {
    so gtk_text_iter_forward_to_line_end($!ti);
  }

  method forward_to_tag_toggle (GtkTextTag() $tag) {
    so gtk_text_iter_forward_to_tag_toggle($!ti, $tag);
  }

  method forward_visible_cursor_position {
    so gtk_text_iter_forward_visible_cursor_position($!ti);
  }

  method forward_visible_cursor_positions (gint $count) {
    so gtk_text_iter_forward_visible_cursor_positions($!ti, $count);
  }

  method forward_visible_line {
    so gtk_text_iter_forward_visible_line($!ti);
  }

  method forward_visible_lines (gint $count) {
    so gtk_text_iter_forward_visible_lines($!ti, $count);
  }

  method forward_visible_word_end {
    so gtk_text_iter_forward_visible_word_end($!ti);
  }

  method forward_visible_word_ends (gint $count) {
    so gtk_text_iter_forward_visible_word_ends($!ti, $count);
  }

  method forward_word_end {
    so gtk_text_iter_forward_word_end($!ti);
  }

  method forward_word_ends (gint $count) {
    so gtk_text_iter_forward_word_ends($!ti, $count);
  }

  method free {
    gtk_text_iter_free($!ti);
  }

  method get_attributes (GtkTextAttributes $values) {
    so gtk_text_iter_get_attributes($!ti, $values);
  }

  method get_buffer {
    # Late binding to prevent circular dependency.
    ::('GTK::TextBuffer').new( gtk_text_iter_get_buffer($!ti) );
  }

  method get_bytes_in_line () {
    gtk_text_iter_get_bytes_in_line($!ti);
  }

  method get_char {
    gtk_text_iter_get_char($!ti);
  }

  method get_chars_in_line {
    gtk_text_iter_get_chars_in_line($!ti);
  }

  method get_child_anchor {
    gtk_text_iter_get_child_anchor($!ti);
  }

  method get_language {
    gtk_text_iter_get_language($!ti);
  }

  method get_marks {
    gtk_text_iter_get_marks($!ti);
  }

  method get_pixbuf {
    gtk_text_iter_get_pixbuf($!ti);
  }

  method get_slice (GtkTextIter() $end) {
    gtk_text_iter_get_slice($!ti, $end);
  }

  method get_tags {
    GTK::Compat::GSList.new( gtk_text_iter_get_tags($!ti) );
  }

  method get_text (GtkTextIter() $end) {
    gtk_text_iter_get_text($!ti, $end);
  }

  method get_toggled_tags (gboolean $toggled_on) {
    gtk_text_iter_get_toggled_tags($!ti, $toggled_on);
  }

  method get_type {
    gtk_text_iter_get_type();
  }

  method get_visible_slice (GtkTextIter() $end) {
    gtk_text_iter_get_visible_slice($!ti, $end);
  }

  method get_visible_text (GtkTextIter() $end) {
    gtk_text_iter_get_visible_text($!ti, $end);
  }

  method has_tag (GtkTextTag() $tag) {
    so gtk_text_iter_has_tag($!ti, $tag);
  }

  method in_range (GtkTextIter() $start, GtkTextIter() $end) {
    so gtk_text_iter_in_range($!ti, $start, $end);
  }

  method inside_sentence {
    so gtk_text_iter_inside_sentence($!ti);
  }

  method inside_word {
    so gtk_text_iter_inside_word($!ti);
  }

  method is_cursor_position {
    so gtk_text_iter_is_cursor_position($!ti);
  }

  method is_end {
    so gtk_text_iter_is_end($!ti);
  }

  method is_start {
    so gtk_text_iter_is_start($!ti);
  }

  method order (GtkTextIter $second) {
    gtk_text_iter_order($!ti, $second);
  }

  method starts_line {
    so gtk_text_iter_starts_line($!ti);
  }

  method starts_sentence {
    so gtk_text_iter_starts_sentence($!ti);
  }

  method starts_tag (GtkTextTag() $tag) {
    so gtk_text_iter_starts_tag($!ti, $tag);
  }

  method starts_word {
    so gtk_text_iter_starts_word($!ti);
  }

  method toggles_tag (GtkTextTag() $tag) {
    so gtk_text_iter_toggles_tag($!ti, $tag);
  }
  # ↑↑↑↑ METHODS ↑↑↑↑

}
