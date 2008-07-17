#!/usr/bin/env perl
use lib 't/lib';
use Test::NetHack::Items (
    (map { $_ => { is_artifact => 1 } }
        "Cleaver",
        "the Master Key of Thievery",
    ),

    (map { $_ => { is_artifact => 0 } }
        "battle-axe",
        "skeleton key",
    ),
);

