#!/usr/bin/env perl
use lib 't/lib';
use Test::NetHack::Items (
    "b - a wakizashi",      {_best_match => "short sword"},
    "f - a ninja-to",       {_best_match => "broadsword"},
    "g - a nunchaku",       {_best_match => "flail"},
    "h - a naginata",       {_best_match => "glaive"},
    "i - an osaku",         {_best_match => "lock pick"},
    "k - a koto",           {_best_match => "wooden harp"},
    "l - a shito",          {_best_match => "knife"},
    "m - a tanko",          {_best_match => "plate mail"},
    "n - a kabuto",         {_best_match => "helmet"},
    "o - a pair of yugake", {_best_match => "leather gloves"},
    "p - a gunyoki",        {_best_match => "food ration"},
    "q - potion of sake",   {_best_match => "potion of booze"},
    "r - potions of sake",  {_best_match => "potion of booze"},
);

