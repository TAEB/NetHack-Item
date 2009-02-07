#!/usr/bin/env perl
use strict;
use warnings;
use Test::More tests => 2;
use NetHack::ItemPool;

my $pool = NetHack::ItemPool->new;

my $spiked = $pool->new_item("a spiked wand");
ok($spiked->tracker, "got a tracker");
ok($spiked->tracker->engrave_useful, "engraving spiked would be useful");

