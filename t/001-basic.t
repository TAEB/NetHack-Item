#!/usr/bin/env perl
use strict;
use warnings;
use Test::More tests => 3;
use NetHack::Item;

my $item = NetHack::Item->new("a long sword");
ok($item, "got an item using new(string)");

$item = NetHack::Item->new({raw => "a long sword"});
ok($item, "got an item using new(hashref)");

$item = NetHack::Item->new(raw => "a long sword");
ok($item, "got an item using new(hash)");

