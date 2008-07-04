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
    my @all_checks = @_;

    while (my ($raw, $checks) = splice @_, 0, 2) {
        my $item = NetHack::Item->new($raw);

        for my $check (sort keys %$checks) {
            if ($item->can($check)) {
                Test::More::is($item->$check, $checks->{$check}, "'$raw' $check");
            }
            else {
                Test::More::fail("'$raw' leaves us without a $check method");
            }
        }
    }
}

sub plan_items {
    my @all_checks = @_;

    my $tests = 0;
    while (my ($item, $checks) = splice @_, 0, 2) {
        $tests += keys %$checks;
    }

    return $tests if defined wantarray;

    Test::More::plan(tests => $tests);
}

1;

