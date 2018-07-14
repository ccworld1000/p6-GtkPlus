use v6.c;

use GTK::Raw::Subs;

role GTK::Roles::Signals {
  has %!signals;

  # Signal handling code thank to jnthn
  method connect($obj, $signal) {
    %!signals{$signal} //= do [
      {
        my $s = Supplier.new;
        g_signal_connect_wd($obj, $signal,
          -> $, $ {
              $s.emit(self);
              CATCH { default { note $_; } }
          },
          OpaquePointer, 0);
        $s.Supply;
      },
      $obj
    ]
    %!signals{$signal}[0];
  }

  method disconnect_all {
    self.disconnect($_) for %!signals.keys;
  }

  method disconnect($signal) {
    g_signal_handler_disconnect(%!signals{$signal}[1], %!signals{$signal}[0]);
    %!signals{$signal}:delete;
  }

}