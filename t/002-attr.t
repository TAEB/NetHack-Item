#!/usr/bin/env perl
use strict;
use warnings;
use Test::More tests => 4;
use NetHack::Item;

can_ok 'NetHack::Item' => qw(raw is_blessed is_uncursed is_cursed slot has_slot);

my $sword = NetHack::Item->new("a long sword");
ok(!$sword->has_slot, "no slot");

$sword = NetHack::Item->new("j - a long sword");
ok($sword->has_slot, "have a slot");
is($sword->slot, "j", "correct slot");

