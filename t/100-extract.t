#!/usr/bin/env perl
use strict;
use warnings;
use Test::More;
use NetHack::Item;
use List::Util 'sum';

my %all_checks = (
    "a long sword" => {
        quantity => 1,
    },
    "the blessed +1 Excalibur" => {
        quantity    => 1,
        enchantment => '+1',
    },
);

plan tests => sum map { scalar keys %$_ } values %all_checks;

for my $item (keys %all_checks) {
    my $checks = $all_checks{$item};

    my $stats = NetHack::Item->extract_stats($item);
    for my $stat (keys %$checks) {
        is($checks->{$stat}, $stats->{$stat}, "$item -> $stat");
    }
}

