#!/usr/bin/env perl
use lib 't/lib';
use Test::NetHack::Item tests => 1;
sub check;

check "a +1 long sword" => "a +3 long sword" => {
    enchantment => '+3',
};

sub check {
    my $before = shift;
    my $after  = shift;
    my $stats  = shift;

    my $item = NetHack::Item->new($before);
    my $new  = NetHack::Item->new($after);
    $item->incorporate_stats_from($new);

    local $Test::Builder::Level = $Test::Builder::Level + 1;
    test_items($item, $stats);
}

