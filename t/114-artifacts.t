#!/usr/bin/env perl
use lib 't/lib';
use Test::NetHack::Items (
    (map { $_ => { is_artifact => 1 } }
        "Cleaver",
        "battle-axe named Cleaver",
        "double-headed axe named Cleaver",
        "battle-axe named cleaver",

        "the Master Key of Thievery",
        "key named Master Key of Thievery",
        "key named the Master Key of Thievery",

        "silver bell",
        "candelabrum",
        "papyrus spellbook",
        "the Bell of Opening",
        "the Candelabrum of Invocation",
        "the Book of the Dead",

        "the Heart of Ahriman",
        "The Orb of Fate",
        "the Mitre of Holiness",

        "an amulet of ESP named The Eye of the Aethiopica",
        "a helm of brilliance named Mitre of Holiness",
        "a luckstone named heart of ahriman",

        "a quarterstaff named The Staff of Aesculapius",
        "a crystal ball named The Orb of Fate",

        "orcish dagger named THE GRIMTOOTH",
        "crude dagger named THE GRIMTOOTH",
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

        "r - a dull spellbook named The Book of the Dead",

        "an amulet versus poison named The Eye of the Aethiopica",
        "a helm of opposite alignment named Mitre of Holiness",
        "a loadstone named heart of ahriman",

    ),

    (map { $_ => { is_artifact => undef } }
        "a gray stone named the Heart of Ahriman",
        "a pyramidal amulet named the Eye of the Aethiopica",
        "a visored helmet named the Mitre of Holiness",
    ),
);

