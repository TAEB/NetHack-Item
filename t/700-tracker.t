#!/usr/bin/env perl
use strict;
use warnings;
use Test::More tests => 3;
use NetHack::ItemPool;

my $pool = NetHack::ItemPool->new;
my $tracker = $pool->tracker_for($pool->new_item("a scroll labeled KIRJE"));
is(scalar($tracker->possibilities), 21, "there are 21 randomized scrolls");

$tracker->rule_out('scroll of fire');
is(scalar($tracker->possibilities), 20, "we ruled out scroll of fire");
is((grep { $_ eq 'scroll of fire' } $tracker->possibilities), 0, "no scroll of fire possibilities");

