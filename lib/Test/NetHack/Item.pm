#!/usr/bin/env perl
package Test::NetHack::Item;
use strict;
use warnings;
use base 'Test::More';

our @EXPORT = qw/test_items plan_items/;

use NetHack::Item;

sub import_extra {
    Test::More->export_to_level(2);
    strict->import;
    warnings->import;
}

sub test_items {
    local $Test::Builder::Level = $Test::Builder::Level + 1;
    my %all_checks = @_;

    for my $item (sort keys %all_checks) {
        my $checks = $all_checks{$item};

        my $item = NetHack::Item->new($item);

        for my $check (sort keys %$checks) {
            Test::More::is($item->$check, $checks->{$check}, "'$item' $check");
        }
    }
}

sub plan_items {
    my %all_checks = @_;

    my $tests = 0;
    $tests += keys %$_ for values %all_checks;

    return $tests if defined wantarray;

    Test::More::plan(tests => $tests);
}

1;

