#!/usr/bin/env perl
use lib 't/lib';
use Test::NetHack::Item tests => 16;
sub check;

check "a +1 long sword" => "a blessed +1 long sword" => {
    buc => 'blessed',
};

check "a cursed +1 long sword" => "a long sword" => {
    buc         => 'cursed',
    enchantment => '+1',
};

check "a +1 long sword" => "the blessed greased +3 Excalibur (weapon in hand)" => {
    buc         => 'blessed',
    artifact    => 'Excalibur',
    enchantment => '+3',
    is_wielded  => 1,
    is_greased  => 1,
};

check "a blessed dagger" => "a poisoned dagger" => {
    buc         => 'blessed',
    is_poisoned => 1,
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
