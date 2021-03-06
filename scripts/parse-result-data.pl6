use v6.c;

use JSON::Fast;

grammar ParseBuildResults {
  regex TOP {
    <section>*
    \v+
    <summary>*
  }
  regex section {
    <header> \s+ <stage>*
  }
  regex summary {
    <summary_type> \s* $<min>=(\d+) 'm' <sec=num> 's' \s*
  }
  regex header {
    ^^ '=== ' <module> ' ===' $$
  }
  regex stage {
    ^^ 'Stage ' <stage_type> \s* ': ' [
      \s* <num> \s*
      |
      \s* <err_msg> \s*
    ]
  }
  regex err_msg {
    '===SORRY!===' .+? <?before \v '==='> $$
  }
  token module {
    (\w+)+ % '::'
  }
  token num {
    \d+ '.' \d+
  }
  token stage_type {
    'start'    | 'parse' | 'syntaxcheck' | 'ast' |
    'optimize' | 'mast'  | 'mbc'         | 'moar'
  }
  token summary_type{
    'real' | 'user' | 'sys'
  }
}

class ResultsBuilder {
  method TOP($/) {
    my %data;
    %data.append: $_.made for $/<section>;
    for $/<summary> {
      my $i = .made;
      %data<SUMMARY>{ $i.key } = $i.value;
    }
    make %data;
  }

  method section($/) {
    my (%sec, %st);
    for $/<stage> -> $s {
      my $p = $s.made;
      next unless $p.defined;
      %st{$p.key} = $p.value;
    }
    %sec{$/<header>.made} = %st;
    make %sec;
  }

  method header($/) {
    make $/<module>.made;
  }

  method module($/) {
    say "Found { $/.Str } section" if $*debug;
    make $/.Str;
  }

  method err_msg($/) {
    say "ERROR! ({$/.from} - {$/.to})" ~ $/.Str if $*debug;
    #exit if $++ > 4;
  }

  method stage($/) {
    return unless $/<stage_type>.defined && $/<num>.defined;
    my $a = $/<stage_type>.Str => $/<num>.Num;
    make $a;
  }

  method summary($/) {
    my $m = $/<summary_type>.Str => $/<min>.Int * 60 + $/<sec>.Num;
    make $m;
  }
}

sub MAIN($file = 'LastBuildResults', :$debug) {
  my $*debug = $debug // False;
  die "Cannot find build results file '$file'." unless $file.IO.e;
  my $last-results = $file.IO.open.slurp-rest;
  my $parse = ParseBuildResults.parse( $last-results, :actions(ResultsBuilder) );
  die 'Could not parse build results file!' unless $parse;
  "{ $file }.json".IO.open(:w).say( to-json($parse.made) );
  say "Output written to '{$file}.json'";
}
