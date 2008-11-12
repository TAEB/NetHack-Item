#!/usr/bin/env perl
use lib 't/lib';
use Test::NetHack::Items (
    "a long sword" => {
        subtype => undef,
    },
    "a leather cloak" => {
        type          => 'armor',
        subtype       => 'cloak',
        possibilities => ['leather cloak'],
    },
    "the Mitre of Holiness" => {
        type          => 'armor',
        subtype       => 'helmet',
        possibilities => ['helm of brilliance'],
    },
    "bag of holding" => {
        type          => 'tool',
        subtype       => 'container',
        possibilities => ['bag of holding'],
    },
    "bag of tricks" => {
        type          => 'tool',
        subtype       => undef,
        possibilities => ['bag of tricks'],
    },
);

