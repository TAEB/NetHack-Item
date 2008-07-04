#!/usr/bin/env perl
use Test::NetHack::Items (
    "a - a +1 long sword (weapon in hand)" => {
        slot       => 'a',
        is_wielded => 1,
    },
);

