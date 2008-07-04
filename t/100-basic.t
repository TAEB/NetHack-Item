#!/usr/bin/env perl
use Test::NetHack::Items (
    "a - a +1 long sword (weapon in hand)" => {
        slot        => 'a',
        quantity    => 1,
        enchantment => 1,
        class       => 'weapon',
        is_wielding => 1,
        buc         => 'uncursed',
    },
);

