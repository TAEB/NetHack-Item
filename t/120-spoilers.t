#!/usr/bin/env perl
use lib 't/lib';
use Test::NetHack::Items (
    "n - a dwarvish mithril-coat" => {
        ac => 6,
        mc => 3,
    },
    "n - a +1 dwarvish mithril-coat" => {
        ac => 7,
        mc => 3,
    },
    "m - a cornuthaum" => {
        ac => 0,
        mc => 2,
    },
    "l - a mummy wrapping" => {
        ac => 0,
        mc => 1,
    },
    "k - a food ration" => {
        nutrition => 800,
        time      => 5,
    },
    "j - a violet gem" => {
        hardness => 'soft',
        softness => 'soft',
    },
    "j - a green gem" => {
        hardness => undef,
        softness => undef,
    },
    "j - an emerald" => {
        hardness => 'hard',
        softness => 'hard',
    },
    "i - a wand of wishing" => {
        maxcharges => 3,
        zaptype    => 'nodir',
    },
    "h - a wand of death" => {
        maxcharges => 8,
        zaptype    => 'ray',
    },
    "g - a wand of striking" => {
        maxcharges => 8,
        zaptype    => 'beam',
    },
);

