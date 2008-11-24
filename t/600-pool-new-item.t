#!/usr/bin/env perl
use strict;
use warnings;
use Test::More tests => 2;
use NetHack::ItemPool;

my $pool = NetHack::ItemPool->new;
my $sword = $pool->new_item("a +1 long sword");

is($sword->identity, "long sword");
is($sword->enchantment, "+1");

