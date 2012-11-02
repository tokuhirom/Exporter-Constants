package Exporter::Constants;
use strict;
use warnings;
use 5.010001;
our $VERSION = '0.01';

use Exporter;
use parent qw/Exporter/;

our @EXPORT = qw/declare_constant/;

sub declare_constant {
    my ($array, $stuff) = @_;

    my $pkg = caller(0);

    no strict 'refs';
    unless ($pkg->isa('Exporter')) {
        unshift @{"$pkg\::ISA"}, 'Exporter';
    }

    while (my ($k, $v) = each %$stuff) {
        *{"$pkg\::$k"} = sub () { $v };
        unshift @$array, $k;
    }
}

1;
__END__

=encoding utf8

=head1 NAME

Exporter::Constants - Declare constants and export it.

=head1 SYNOPSIS

    package My::Constants;
    # declare constants and push to @EXPORT
    use parent qw/Exporter/;
    our @EXPORT;

    declare_constant(
        \@EXPORT => {
            'TYPE_A' => 4649,
            'TYPE_B' => 5963
        }
    );

    package main;
    use My::Constants;

    # constants are exported.
    print TYPE_A, "\n";

=head1 DESCRIPTION

This module help to declare & export constants.

=head1 MOTIVATION

I want to declare My::Own::Constants package when writing applications.
These class declares constants and export to other application classes.

I can do this task by Exporter.pm and constants.pm. But I want to do it at once.

=head1 AUTHOR

Tokuhiro Matsuno E<lt>tokuhirom AAJKLFJEF@ GMAIL COME<gt>

=head1 LICENSE

Copyright (C) Tokuhiro Matsuno

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
