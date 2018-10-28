use v6.c;

use NativeCall;

use GTK::Compat::Types;
use GTK::Raw::Types;

unit package GTK::Raw::PaperSize;

sub gtk_paper_size_copy (GtkPaperSize $other)
  returns GtkPaperSize
  is native(gtk)
  is export
  { * }

sub gtk_paper_size_free (GtkPaperSize $size)
  is native(gtk)
  is export
  { * }

sub gtk_paper_size_get_default ()
  returns Str
  is native(gtk)
  is export
  { * }

sub gtk_paper_size_get_default_bottom_margin (
  GtkPaperSize $size,
  uint32 $unit                  # GtkUnit $unit
)
  returns gdouble
  is native(gtk)
  is export
  { * }

sub gtk_paper_size_get_default_left_margin (
  GtkPaperSize $size,
  uint32 $unit                  # GtkUnit $unit
)
  returns gdouble
  is native(gtk)
  is export
  { * }

sub gtk_paper_size_get_default_right_margin (
  GtkPaperSize $size,
  uint32 $unit                  # GtkUnit $unit
)
  returns gdouble
  is native(gtk)
  is export
  { * }

sub gtk_paper_size_get_default_top_margin (
  GtkPaperSize $size,
  uint32 $unit                  # GtkUnit $unit
)
  returns gdouble
  is native(gtk)
  is export
  { * }

sub gtk_paper_size_get_display_name (GtkPaperSize $size)
  returns Str
  is native(gtk)
  is export
  { * }

sub gtk_paper_size_get_height (
  GtkPaperSize $size,
  uint32 $unit                  # GtkUnit $unit
)
  returns gdouble
  is native(gtk)
  is export
  { * }

sub gtk_paper_size_get_name (GtkPaperSize $size)
  returns Str
  is native(gtk)
  is export
  { * }

sub gtk_paper_size_get_paper_sizes (gboolean $include_custom)
  returns GList
  is native(gtk)
  is export
  { * }

sub gtk_paper_size_get_ppd_name (GtkPaperSize $size)
  returns Str
  is native(gtk)
  is export
  { * }

sub gtk_paper_size_get_type ()
  returns GType
  is native(gtk)
  is export
  { * }

sub gtk_paper_size_get_width (
  GtkPaperSize $size,
  uint32 $unit                  # GtkUnit $unit
)
  returns gdouble
  is native(gtk)
  is export
  { * }

sub gtk_paper_size_is_custom (GtkPaperSize $size)
  returns uint32
  is native(gtk)
  is export
  { * }

sub gtk_paper_size_is_equal (GtkPaperSize $size1, GtkPaperSize $size2)
  returns uint32
  is native(gtk)
  is export
  { * }

sub gtk_paper_size_is_ipp (GtkPaperSize $size)
  returns uint32
  is native(gtk)
  is export
  { * }

sub gtk_paper_size_new (gchar $name)
  returns GtkPaperSize
  is native(gtk)
  is export
  { * }

sub gtk_paper_size_new_custom (
  gchar $name,
  gchar $display_name,
  gdouble $width,
  gdouble $height,
  uint32 $unit                  # GtkUnit $unit
)
  returns GtkPaperSize
  is native(gtk)
  is export
  { * }

sub gtk_paper_size_new_from_gvariant (GVariant $variant)
  returns GtkPaperSize
  is native(gtk)
  is export
  { * }

sub gtk_paper_size_new_from_ipp (
  gchar $ipp_name,
  gdouble $width,
  gdouble $height
)
  returns GtkPaperSize
  is native(gtk)
  is export
  { * }

sub gtk_paper_size_new_from_key_file (
  GKeyFile $key_file,
  gchar $group_name,
  GError $error
)
  returns GtkPaperSize
  is native(gtk)
  is export
  { * }

sub gtk_paper_size_new_from_ppd (
  gchar $ppd_name,
  gchar $ppd_display_name,
  gdouble $width,
  gdouble $height
)
  returns GtkPaperSize
  is native(gtk)
  is export
  { * }

sub gtk_paper_size_set_size (
  GtkPaperSize $size,
  gdouble $width,
  gdouble $height,
  uint32 $unit                  # GtkUnit $unit
)
  is native(gtk)
  is export
  { * }

sub gtk_paper_size_to_gvariant (GtkPaperSize $paper_size)
  returns GVariant
  is native(gtk)
  is export
  { * }

sub gtk_paper_size_to_key_file (
  GtkPaperSize $size,
  GKeyFile $key_file,
  gchar $group_name
)
  is native(gtk)
  is export
  { * }