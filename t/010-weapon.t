#!/usr/bin/env perl
use strict;
use warnings;
use Test::More tests => 9;
use NetHack::Item::Weapon;

my $weapon = NetHack::Item::Weapon->new("a +1 long sword");
ok($weapon, "got a weapon");
is($weapon->type, "weapon");
is($weapon->enchantment, '+1', "+1 enchantment");

my $item = NetHack::Item->new(raw => "a -3 long sword", type => "weapon");
ok($item, "got an item");
is($item->type, "weapon");
isa_ok $item => 'NetHack::Item::Weapon';
is($item->enchantment, '-3', "-3 enchantment");

$weapon = NetHack::Item::Weapon->new("a long sword (weapon in hand)");
ok($weapon, "got a weapon");
ok($weapon->wielded, "wielding this weapon");

