#!/usr/bin/env perl
use strict;
use warnings;
use Test::More tests => 7;
use NetHack::Item::Armor;

my $cloak = NetHack::Item::Armor->new("a cloak of magic resistance");
ok($cloak, "got aarmor");
is($cloak->type, "armor");
ok(!$cloak->worn, "armor is not worn");

my $item = NetHack::Item->new(raw => "a cloak of magic resistance (being worn)", type => "armor");
ok($item, "got an item");
is($item->type, "armor");
isa_ok $item => 'NetHack::Item::Armor';
ok($item->worn, "armor is being worn");

