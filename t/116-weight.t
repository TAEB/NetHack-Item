#!/usr/bin/env perl
use lib 't/lib';
use constant testing_method => 'weight';
use Test::NetHack::Items (
    "oil lamp"           => 20,
    "magic lamp"         => 20,
    "lamp"               => 20,
    "tooled horn"        => 18,
    "horn"               => 18,
    "potion of water"    => 20,
    "2 potions of water" => 40,
);

