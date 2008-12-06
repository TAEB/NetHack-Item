#!/usr/bin/env perl
use strict;
use warnings;
use Test::More tests => 6;
use NetHack::ItemPool;

my $pool = NetHack::ItemPool->new;
my $balsa = $pool->new_item("a balsa wand");
ok($balsa->tracker->engrave_useful);
$balsa->tracker->rule_out_all_but('wand of fire', 'wand of sleep', 'wand of death');
ok($balsa->tracker->engrave_useful, 'engrave is useful');
$balsa->tracker->rule_out('wand of fire');
ok(!$balsa->tracker->engrave_useful, 'engrave is no longer useful');

my $other_balsa = $pool->new_item("a blessed balsa wand");
is($balsa->tracker, $other_balsa->tracker, "same tracker for two items");

$other_balsa->tracker->rule_out('wand of sleep');

is($other_balsa->identity, 'wand of death');
is($balsa->identity, 'wand of death');

