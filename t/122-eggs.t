#!/usr/bin/env perl
use strict;
use warnings;
use Test::More tests => 1;
use NetHack::Item;

my $item = eval { NetHack::Item->new('3 uncursed eggs') };
ok(!$@, "'3 uncursed eggs' didn't throw an error");
