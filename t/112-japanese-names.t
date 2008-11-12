#!/usr/bin/env perl
use lib 't/lib';
use Test::More skip_all => "_best_match deprecated";
use constant testing_method => '_best_match';
use Test::NetHack::Items (
    "b - a wakizashi"      => "short sword",
    "f - a ninja-to"       => "broadsword",
    "g - a nunchaku"       => "flail",
    "h - a naginata"       => "glaive",
    "i - an osaku"         => "lock pick",
    "k - a koto"           => "wooden harp",
    "l - a shito"          => "knife",
    "m - a tanko"          => "plate mail",
    "n - a kabuto"         => "helmet",
    "o - a pair of yugake" => "leather gloves",
    "p - a gunyoki"        => "food ration",
    "q - potion of sake"   => "potion of booze",
    "r - potions of sake"  => "potion of booze",
);

