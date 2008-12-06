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
    "f - a ring of adornment" => {
        chargeable => 1,
    },
    "f - a ring of slow digestion" => {
        chargeable => 0,
    },
    "f - an opal ring" => {
        chargeable => undef,
    },
    "e - a scroll of genocide" => {
        ink => 30,
    },
    "e - a scroll of mail" => {
        ink => 2,
    },
    "e - an unlabeled scroll" => {
        ink => 0,
    },
    "d - a spellbook of finger of death" => {
        ink => 70,
    },
    "d - a spellbook of jumping" => {
        ink => 10,
    },
);

