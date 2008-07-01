#!/usr/bin/env perl
use strict;
use warnings;
use Test::More tests => 6;
use NetHack::Item;

for ([is_blessed => 1], [buc => "blessed"]) {
    my $item = NetHack::Item->new(raw => "a long sword", @$_);
    ok($item->is_blessed, "the sword is blessed");
    is($item->is_uncursed, 0, "the sword is not uncursed");
    is($item->is_cursed, 0, "the sword is not cursed");
}

