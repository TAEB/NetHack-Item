#!/usr/bin/env perl
use strict;
use warnings;
use Test::More tests => 22;
use NetHack::Item::Ring;

my $ring = NetHack::Item::Ring->new("a ring of conflict");
ok($ring, "got a ring");
is($ring->type, "ring");
is($ring->hand, undef);
ok(!$ring->worn, "ring is not worn");
ok(!$ring->is_wielded, "ring is not wielded");
is($ring->enchantment, undef, "unknown enchantment");

my $item = NetHack::Item->new(raw => "a ring of conflict (on left hand)", type => "ring");
ok($item, "got an item");
is($item->type, "ring");
isa_ok $item => 'NetHack::Item::Ring';
is($item->hand, 'left');
ok($item->worn, "ring is being worn");
ok(!$ring->is_wielded, "ring is not wielded");
is($ring->enchantment, undef, "unknown enchantment");

$ring = NetHack::Item::Ring->new("a +30 ring of adornment");
ok($ring, "got a ring");
is($ring->type, "ring");
is($ring->enchantment, '+30', "you need it");
ok(!$ring->is_wielded, "ring is not wielded");

$ring = NetHack::Item::Ring->new("d - an uncursed +5 ring of gain constitution (weapon in hand)");
ok($ring, "got a ring");
is($ring->type, "ring");
is($ring->slot, 'd');
is($ring->enchantment, '+5', "you need it");
ok($ring->is_wielded, "ring is wielded");

