#!/usr/bin/env perl
use strict;
use warnings;
use Test::More tests => 22;
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

my $boots = $pool->new_item("a pair of combat boots");
ok(!$boots->is_worn, "not worn yet");
is($inv->boots, undef, "no boots yet");

$boots->is_worn(1);
ok($boots->is_worn, "worn now");
is($inv->boots, $boots, "wearing our boots");

$boots->is_worn(0);
ok(!$boots->is_worn, "not worn");
is($inv->boots, undef, "not wearing our boots");

my $ring = $pool->new_item("an opal ring");
ok(!$ring->is_worn, "not worn yet");
is($inv->left_ring, undef, "no ring yet");

$ring->hand("left");
is($ring->hand, "left", "worn on left hand now");
ok($ring->is_worn, "worn now");
is($inv->left_ring, $ring, "wearing our left-hand ring");

$ring->hand(undef);
is($ring->hand, undef, "no longer on a hand");
ok(!$ring->is_worn, "no longer worn");
is($inv->left_ring, undef, "no longer wearing our left-hand ring");
