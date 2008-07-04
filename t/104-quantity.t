#!/usr/bin/env perl
use lib 't/lib';
use Test::NetHack::Items (
    "a - a +1 long sword (weapon in hand)", {quantity => 1},
    "A - an uncursed +0 orcish ring mail",  {quantity => 1},
    "k - the Eye of the Aethiopica",        {quantity => 1},
    "j - 2 slime molds",                    {quantity => 2},
    "m - 23 uncursed rocks",                {quantity => 23},
    '$ - 3 gold pieces',                    {quantity => 3},
    "3 gold pieces",                        {quantity => 3},
);

