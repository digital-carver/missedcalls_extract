#!perl

use strict;
use warnings;
use English;
use feature ':5.10';
use XML::Parser;
use Data::Dumper;

unless (@ARGV) {
    die "I need the xml file's full path as an argument\n";
}

my $filename = shift;
unless (-f $filename) {
    die "That's not even a real file. $OS_ERROR\n";
}

my $xp   = XML::Parser->new(Style => 'Tree');
my $tree = $xp->parsefile($filename);

#say Dumper($tree->[1]);
#The whole thing is within a <calls>, so $tree->[1] contains all data
foreach my $elem (@{$tree->[1]}) {
    if (ref($elem) && ref($elem) eq 'ARRAY') {
        my $call_info = $elem->[0];
        #Type 3 is missed calls
        if ($call_info->{type} eq "3") {
            say "Missed from $call_info->{contact_name} ($call_info->{number})".
                            " at $call_info->{readable_date}";
            # double-pipe seems least likely to occur in Contactname, so delim
            say STDERR "$call_info->{contact_name} || $call_info->{number} ||".
                            " $call_info->{readable_date}";
        }
    }
}

