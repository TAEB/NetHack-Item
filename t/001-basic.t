#!/usr/bin/env perl
use strict;
use warnings;
use Test::More tests => 8;
use Test::Exception;
use NetHack::Item;

my $item = NetHack::Item->new("a long sword");
ok($item, "got an item using new(string)");
is($item->raw, "a long sword");

$item = NetHack::Item->new({raw => "a long sword"});
ok($item, "got an item using new(hashref)");
is($item->raw, "a long sword");

$item = NetHack::Item->new(raw => "a long sword");
ok($item, "got an item using new(hash)");
is($item->raw, "a long sword");

throws_ok {
    $item = NetHack::Item->new(blessed => 1);
} qr/Attribute \(raw\) is required/;

throws_ok {
    $item = NetHack::Item->new(raw => "a terminal", type => "nonexistent_item_type!");
} qr/Could not load class \(NetHack::Item::Nonexistent_item_type!\)/;

