package t::Testee;
use strict;
use warnings;
use utf8;
use parent qw/Exporter/;

our @EXPORT;

use Exporter::Constants (
    \@EXPORT => {
        TYPE_A => 4649,
        TYPE_B => 5963,
    },
);

1;

