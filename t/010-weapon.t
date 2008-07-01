#!/usr/bin/env perl
use strict;
use warnings;
use Test::More tests => 1;
use NetHack::Item::Weapon;

my $weapon = NetHack::Item::Weapon->new("a long sword");
ok($weapon, "got a weapon");

