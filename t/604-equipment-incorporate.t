#!/usr/bin/env perl
use strict;
use warnings;
use Test::More tests => 1;
use NetHack::ItemPool;

my $pool = NetHack::ItemPool->new;
my $inv = $pool->inventory;

my $shield = $pool->new_item("c - an uncursed +3 small shield (being worn)");
$inv->update($shield);

$shield = $pool->new_item("c - an uncursed +3 small shield (being worn)");
$inv->update($shield);

is($inv->shield, $inv->get('c'), "Incorporating worn items leaves equipment consistent");
