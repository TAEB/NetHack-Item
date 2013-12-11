#!/usr/bin/env perl
use lib 't/lib';
use Test::NetHack::Item;

my $pool = NetHack::ItemPool->new;
ok(!$pool->has_identified("scroll of fire"), "have not IDed scroll of fire");
ok(!$pool->has_identified("scroll of genocide"), "have not IDed scroll of genocide");

my $kirje = $pool->new_item("a scroll labeled KIRJE");
my $tracker = $pool->tracker_for($kirje);
is(scalar($tracker->possibilities), 21, "there are 21 randomized scrolls");
is(scalar($kirje->possibilities), 21, "21 possibilities");
ok($tracker->includes_possibility('scroll of fire'), "KIRJE is possibly fire");
ok(!$pool->has_identified("scroll of fire"), "have not IDed scroll of fire");
ok(!$pool->has_identified("scroll of genocide"), "have not IDed scroll of genocide");

$tracker->rule_out('scroll of fire');
is(scalar($tracker->possibilities), 20, "we ruled out scroll of fire");
is(scalar($kirje->possibilities), 20, "20 possibilities");
is((grep { $_ eq 'scroll of fire' } $tracker->possibilities), 0, "no scroll of fire possibilities");
ok(!$tracker->includes_possibility('scroll of fire'), "KIRJE is not fire");
ok(!$pool->has_identified("scroll of fire"), "have not IDed scroll of fire");
ok(!$pool->has_identified("scroll of genocide"), "have not IDed scroll of genocide");

$tracker->identify_as('scroll of genocide');
is(scalar($tracker->possibilities), 1, "we identified as genocide");
ok(!$tracker->includes_possibility('scroll of fire'), "KIRJE is not fire");
ok(!$tracker->includes_possibility('scroll of punishment'), "KIRJE is not punishment");
ok($tracker->includes_possibility('scroll of genocide'), "KIRJE is genocide!");
is(scalar($kirje->possibilities), 1, "1 possibility");
is($kirje->identity, 'scroll of genocide', 'identity is "set by possibility tracker" or at least, appears like it is');
ok(!$pool->has_identified("scroll of fire"), "have not IDed scroll of fire");
ok($pool->has_identified("scroll of genocide"), "have IDed scroll of genocide");
is($pool->has_identified("scroll of genocide"), $tracker, "... and can get its tracker");

my $tharr = $pool->new_item("a scroll labeled THARR");
my $tharr_tracker = $tharr->tracker;
is($tharr_tracker->possibilities, 20, "20 possibilities");
ok($tharr_tracker->includes_possibility('scroll of fire'), "THARR can be fire");
ok(!$tharr_tracker->includes_possibility('scroll of genocide'), "THARR cannot be genocide");

is(@{ $tharr->tracker->_all_possibilities }, 21, "all possibilities is immutable");
done_testing;
