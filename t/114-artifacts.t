#!/usr/bin/env perl
use lib 't/lib';
use Test::NetHack::Items (
    (map { $_ => { is_artifact => 1 } }
        "Cleaver",
        "battle-axe named Cleaver",
        "double-headed axe named Cleaver",

        "the Master Key of Thievery",
        "key named Master Key of Thievery",
        "key named the Master Key of Thievery",
    ),

    (map { $_ => { is_artifact => 0 } }
        "battle-axe",
        "battle-axe called Cleaver",
        "double-headed axe called Cleaver",
        "angled poleaxe named Cleaver",
        "halberd named Cleaver",
        "angled poleaxe called Cleaver",
        "halberd called Cleaver",

        "skeleton key",
        "key named foo Master Key of Thievery",
        "key named Master Key of the Thievery",
        "key called Master Key of Thievery",
        "key called the Master Key of Thievery",
    ),
);

