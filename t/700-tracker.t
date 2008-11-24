#!/usr/bin/env perl
use strict;
use warnings;
use Test::More tests => 13;
use NetHack::ItemPool;

my $pool = NetHack::ItemPool->new;
my $kirje = $pool->new_item("a scroll labeled KIRJE");
my $tracker = $pool->tracker_for($kirje);
is(scalar($tracker->possibilities), 21, "there are 21 randomized scrolls");
is(scalar($kirje->possibilities), 21, "21 possibilities");
ok($tracker->includes_possibility('scroll of fire'), "KIRJE is possibly fire");

$tracker->rule_out('scroll of fire');
is(scalar($tracker->possibilities), 20, "we ruled out scroll of fire");
is(scalar($kirje->possibilities), 20, "20 possibilities");
is((grep { $_ eq 'scroll of fire' } $tracker->possibilities), 0, "no scroll of fire possibilities");
ok(!$tracker->includes_possibility('scroll of fire'), "KIRJE is not fire");

$tracker->identify_as('scroll of genocide');
is(scalar($tracker->possibilities), 1, "we identified as genocide");
ok(!$tracker->includes_possibility('scroll of fire'), "KIRJE is not fire");
ok(!$tracker->includes_possibility('scroll of punishment'), "KIRJE is not punishment");
ok($tracker->includes_possibility('scroll of genocide'), "KIRJE is genocide!");
is(scalar($kirje->possibilities), 1, "1 possibility");
is($kirje->identity, 'scroll of genocide', 'identity is "set by possibility tracker" or at least, appears like it is');

