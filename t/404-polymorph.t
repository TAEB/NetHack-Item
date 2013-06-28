#!/usr/bin/env perl
use lib 't/lib';
use Test::NetHack::Item;

my $start = NetHack::Item->new("a blessed spellbook of force bolt");
my $end = NetHack::Item->new("a white spellbook");

ok($start->is_blessed);
is($end->is_blessed, undef);
is($end->is_uncursed, undef);
is($end->is_cursed, undef);

$end->did_polymorph_from($start);

ok($end->is_blessed);
ok(!$end->is_uncursed);
ok(!$end->is_cursed);

done_testing;
