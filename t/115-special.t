#!/usr/bin/env perl
use lib 't/lib';
use Test::NetHack::Items (
    "a candelabrum (no candles attached)" => {
        candles_attached => 0,
        is_lit           => 0,
    },
    "a candelabrum (1 candle attached)" => {
        candles_attached => 1,
        is_lit           => 0,
    },
    "a candelabrum (7 candles attached)" => {
        candles_attached => 7,
        is_lit           => 0,
    },
    "a candelabrum (1 candle attached, lit)" => {
        candles_attached => 1,
        is_lit           => 1,
    },
    "a candelabrum (7 candles attached, lit)" => {
        candles_attached => 7,
        is_lit           => 1,
    },
);

