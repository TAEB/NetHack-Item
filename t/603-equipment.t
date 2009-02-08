#!/usr/bin/env perl
use strict;
use warnings;
use Test::More tests => 8;
use NetHack::ItemPool;

my $pool = NetHack::ItemPool->new;
my $inv = $pool->inventory;

my $sword = $pool->new_item("m - a +1 long sword (weapon in hand)");
ok($sword->is_wielded, "our sword is wielded");

$inv->update($sword);
is($inv->weapon, $sword, "creating an item (weapon in hand) updated our wielded weapon");

my $excal = $pool->new_item("f - the +3 Excalibur (weapon in hand)");
ok($excal->is_wielded, "Excalibur is wielded");

is($inv->weapon, $sword, "we still use a regular long sword");

$inv->update($excal);

is($inv->weapon, $excal, "we switched to Excalibur after updating inventory");

ok(!$sword->is_wielded, "wielding Excalibur means our sword is no longer wielded");

$inv->remove('f');
ok(!$excal->is_wielded, "Excalibur is no longer wielded; it left our inventory");
ok(!$inv->has_weapon, "no weapon");

