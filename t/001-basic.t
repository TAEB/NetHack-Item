#!/usr/bin/env perl
use strict;
use warnings;
use Test::More tests => 1;
use NetHack::Item;

my $item = NetHack::Item->new("a long sword");
ok($item, "got an item");

