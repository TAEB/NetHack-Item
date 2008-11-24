#!/usr/bin/env perl
use strict;
use warnings;
use Test::More tests => 11;
use NetHack::ItemPool;

my $pool = NetHack::ItemPool->new;
ok(!$pool->inventory->has_items, "no items yet");

my $sword = $pool->new_item("j - a +1 long sword");
is($pool->inventory->get('j'), $sword, "intuited the slot as j");

my $new_sword = $pool->new_item("a +2 long sword");
$pool->inventory->set(j => $new_sword);
is($pool->inventory->get('j'), $new_sword, "new item in the slot");
is($sword->enchantment, '+1', 'the sword is not updated because it was manually replaced with a new item');

$pool->inventory->update($pool->new_item("j - a +3 long sword"));
is($pool->inventory->get('j'), $new_sword, "previous item in the slot");
is($new_sword->enchantment, '+3');

my $k_sword = $pool->new_item("k - a +5 long sword");
$pool->inventory->update($k_sword);
is($pool->inventory->get('j'), $new_sword, "previous item in the slot");
is($pool->inventory->get('k'), $k_sword, "new item in the new slot");
is($new_sword->enchantment, '+3', "didn't update the enchantment of the old item");

my $k_dagger = $pool->new_item("k - a +1 dagger");
is($pool->inventory->get('k'), $k_dagger, "new item in the new slot");
is($k_sword->enchantment, "+5", "didn't update the long sword");

