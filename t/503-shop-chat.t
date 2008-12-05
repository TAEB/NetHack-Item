#!/usr/bin/env perl
use lib 't/lib';
use Test::NetHack::Items (
    "a candle, 13 zorkmids" => {
        appearance       => 'candle',
        quantity         => 1,
        cost             => 13,
    },
    "9 candles, 26 zorkmids each" => {
        appearance       => 'candle',
        quantity         => 9,
        cost             => 234,
    },
    "a tinning kit, no charge" => {
        appearance       => 'tinning kit',
        quantity         => 1,
        cost             => 0,
    },
    "4 food rations, no charge" => {
        appearance       => 'food ration',
        quantity         => 4,
        cost             => 0,
    },
    "a splint mail, price 106 zorkmids, finest quality" => {
        appearance       => 'splint mail',
        quantity         => 1,
        cost             => 106,
    },
);

