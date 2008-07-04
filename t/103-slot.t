#!/usr/bin/env perl
use lib 't/lib';
use Test::NetHack::Items (
    "a - a +1 long sword (weapon in hand)", {slot => 'a'},
    "B + a blessed +0 alchemy smock",       {slot => 'B'},

    # if your inventory is full, and you pick up an unusual item, # is the
    # overflow slot. you can have multiple items in #, even!
    "# - 5 gold pieces",                    {slot => '#'},
    "# - a cursed gray stone",              {slot => '#'},
);

