#!/usr/bin/env perl
use strict;
use warnings;
use Test::More tests => 7;
use NetHack::Item::Ring;

my $ring = NetHack::Item::Ring->new("a ring of conflict");
ok($ring, "got a ring");
is($ring->type, "ring");
is($ring->hand, undef);

my $item = NetHack::Item->new(raw => "a ring of conflict (on left hand)", type => "ring");
ok($item, "got an item");
is($item->type, "ring");
isa_ok $item => 'NetHack::Item::Ring';
is($item->hand, 'left');

