#!/usr/bin/env perl
use lib 't/lib';
use Test::NetHack::Item tests => 30;
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

check "a black dragon corpse" => "a partly eaten black dragon corpse" => {
    is_partly_eaten => 1,
};

check "a potion of see invisible" => "a diluted potion of see invisible" => {
    is_diluted => 1,
};

check "a ring of see invisible" => "a ring of see invisible (on left hand)" => {
    hand => 'left',
};

check "a ring of see invisible (on left hand)" => "a ring of see invisible (on right hand)" => {
    hand => 'right',
};

check "a ring of see invisible (on right hand)" => "a ring of see invisible" => {
    hand => undef,
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

