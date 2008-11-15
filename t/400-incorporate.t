#!/usr/bin/env perl
use lib 't/lib';
use Test::NetHack::Item tests => 12;
sub check;

check "a +1 long sword" => "a blessed +1 long sword" => {
    buc => 'blessed',
};

check "a cursed +1 long sword" => "a long sword" => {
    buc         => 'cursed',
    enchantment => '+1',
};

check "a +1 long sword" => "the blessed +3 Excalibur" => {
    buc         => 'blessed',
    artifact    => 'Excalibur',
    enchantment => '+3',
};

sub check {
    my $before = shift;
    my $after  = shift;
    my $stats  = shift;

    for my $other ($after, NetHack::Item->new($after)) {
        my $item = NetHack::Item->new($before);
        $item->incorporate_stats_from($other);

        local $Test::Builder::Level = $Test::Builder::Level + 1;
        test_items($item, $stats);
    }
}

