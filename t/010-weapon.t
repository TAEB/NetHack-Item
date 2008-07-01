#!/usr/bin/env perl
use strict;
use warnings;
use Test::More tests => 4;
use NetHack::Item::Weapon;

my $weapon = NetHack::Item::Weapon->new("a long sword");
ok($weapon, "got a weapon");

my $item = NetHack::Item->new(raw => "a long sword", type => "weapon");
ok($item, "got an item");
is($item->type, "weapon");
isa_ok $item => 'NetHack::Item::Weapon';

