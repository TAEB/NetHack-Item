#!/usr/bin/env perl
use lib 't/lib';
use Test::NetHack::Item tests => 5;

my $bag = NetHack::Item->new("a bag");
is($bag->type, 'tool', "bags are tools");
is($bag->subtype, undef, "plain bags are not necessarily containers; could be tricks");

my $sack = NetHack::Item->new("a sack");
is($sack->type, 'tool', "sacks are tools");
is($sack->subtype, 'container', "sacks are containers");
ok(!$sack->contents_known, "we don't know what's in the sack yet");

