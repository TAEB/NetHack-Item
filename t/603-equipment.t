#!/usr/bin/env perl
use strict;
use warnings;
use Test::More tests => 7;
use NetHack::ItemPool;

my $pool = NetHack::ItemPool->new;
my $sword = $pool->new_item("m - a +1 long sword (weapon in hand)");
ok($sword->is_wielded, "our sword is wielded");
is($pool->inventory->weapon, $sword, "creating an item (weapon in hand) updated our wielded weapon");

my $excal = $pool->new_item("f - the +3 Excalibur (weapon in hand)");
ok($excal->is_wielded, "Excalibur is wielded");
is($pool->inventory->weapon, $excal, "we switched to Excalibur");

ok(!$sword->is_wielded, "wielding Excalibur means our sword is no longer wielded");

$pool->inventory->remove('f');
ok(!$excal->is_wielded, "Excalibur is no longer wielded; it left our inventory");
ok(!$pool->inventory->has_weapon, "no weapon");

