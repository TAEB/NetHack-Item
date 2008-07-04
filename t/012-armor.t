#!/usr/bin/env perl
use strict;
use warnings;
use Test::More tests => 14;
use NetHack::Item::Armor;

my $cloak = NetHack::Item::Armor->new("a cloak of magic resistance");
ok($cloak, "got aarmor");
is($cloak->type, "armor");
ok(!$cloak->worn, "armor is not worn");
is($cloak->enchantment, undef, "unknown enchantment");

for ([type => 'armor'], []) {
    my $item = NetHack::Item->new(raw => "a -5 cloak of magic resistance (being worn)", @$_);
    ok($item, "got an item");
    is($item->type, "armor");
    isa_ok $item => 'NetHack::Item::Armor';
    ok($item->worn, "armor is being worn");
    is($item->enchantment, '-5', "-5 MR is still worth it");
}

