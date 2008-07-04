#!/usr/bin/env perl
use strict;
use warnings;
use Test::More tests => 36;
use NetHack::Item;

for my $buc (qw/blessed uncursed cursed/) {
    my %others = map { $_ => 1 } qw/blessed uncursed cursed/;
    delete $others{$buc};

    for (["is_$buc" => 1], [buc => $buc]) {
        my $item = NetHack::Item->new(raw => "a long sword", @$_);
        my $method = "is_$buc";
        ok($item->$method, "the sword is $buc");

        for my $buc (keys %others) {
            my $method = "is_$buc";
            is($item->$method, 0, "the sword is not $buc");
        }
    }

    my $method = "is_$buc";

    my $sword = NetHack::Item->new("a $buc long sword");
    ok($sword->$method, "the sword is $buc, parsed from the description");

    for my $buc (keys %others) {
        my $method = "is_$buc";
        is($sword->$method, 0, "the sword is NOT $buc");
    }
}

my $sword = NetHack::Item->new("a long sword");
is($sword->$_, undef, $_) for qw/is_blessed is_uncursed is_cursed/;

$sword->is_cursed(0);

is($sword->$_, undef, $_) for qw/is_blessed is_uncursed/;
is($sword->is_cursed, 0, "is_cursed");

$sword->is_blessed(0);

is($sword->$_, 0, $_) for qw/is_blessed is_cursed/;
is($sword->is_uncursed, 1, "setting two of the three to 0 will set the other to 1");

