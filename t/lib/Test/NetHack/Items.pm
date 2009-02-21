package Test::NetHack::Items;
use strict;
use warnings;
use Test::NetHack::Item;

sub import {
    local $Test::Builder::Level = $Test::Builder::Level + 1;

    my $class = shift;
    my @items = @_;

    plan_items(@items);
    test_items(@items);
}

1;

