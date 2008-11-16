#!/usr/bin/env perl
use lib 't/lib';
use Test::NetHack::Item tests => 13;

my $bag = NetHack::Item->new("a bag");
is($bag->type, 'tool', "bags are tools");
is($bag->subtype, undef, "plain bags are not necessarily containers; could be tricks");

my $sack = NetHack::Item->new("a sack");
is($sack->type, 'tool', "sacks are tools");
is($sack->subtype, 'container', "sacks are containers");
is_deeply($sack->contents, [], "no known contents yet");
ok(!$sack->contents_known, "we don't know what's in the sack yet");

is($bag->container, undef, "no container yet");

$sack->add_item($bag);
is_deeply($sack->contents, [$bag], "what contents we know so far");
ok(!$sack->contents_known, "even if we add an item, we don't know the contents yet");

is($bag->container, $sack, "the bag is in the sack");

$sack->add_item($bag);
is_deeply($sack->contents, [$bag], "the bag is already in the sack");

$sack->remove_item($bag);
is_deeply($sack->contents, [], "the bag was removed from the bag");
is($bag->container, undef, "no container for the bag any more");

