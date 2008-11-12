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
        # simplification if a lot of tests check exactly the same one thing
        if (main->can('testing_method') && !ref($checks)) {
            $checks = { scalar(main->testing_method) => $checks };
        }

        my $item = eval { NetHack::Item->new($raw) };
        if (!defined($item)) {
            Test::More::diag($@);
            Test::More::fail("Unable to parse '$raw'")
                for keys %$checks;
            next;
        }

        for my $check (sort keys %$checks) {
            if ($item->can($check)) {
                my @values = $item->$check;
                my $value = ref($checks->{$check}) eq 'ARRAY'
                          ? \@values
                          : $values[0];
                Test::More::is_deeply($value, $checks->{$check}, "'$raw' $check");
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
        $tests += ref($checks) eq 'HASH' ? keys %$checks : 1;
    }

    return $tests if defined wantarray;

    Test::More::plan(tests => $tests);
}

1;

