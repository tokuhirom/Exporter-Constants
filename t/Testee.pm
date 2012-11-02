package t::Testee;
use strict;
use warnings;
use utf8;
use parent qw/Exporter/;

use Exporter::Constants;

our @EXPORT;

declare_constant(
    \@EXPORT, +{
        TYPE_A => 4649,
        TYPE_B => 5963,
        TYPE_C => 1192,
    }
);

1;

