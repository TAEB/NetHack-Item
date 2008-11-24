#!/usr/bin/env perl
use strict;
use warnings;
use Test::More tests => 1;
use NetHack::ItemPool;

my $pool = NetHack::ItemPool->new;
my $item = $pool->new_item("a scroll labeled KIRJE");
my $tracker = $pool->tracker_for($item);

