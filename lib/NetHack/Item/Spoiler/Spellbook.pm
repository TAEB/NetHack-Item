package NetHack::Item::Spoiler::Spellbook;
use strict;
use warnings;
use base 'NetHack::Item::Spoiler';

use constant type => 'spellbook';

my @spellbooks = map { "$_ spellbook" } (
    qw/parchment vellum ragged mottled stained cloth leather white pink red
    orange yellow velvet turquoise cyan indigo magenta purple violet tan plaid
    gray wrinkled dusty bronze copper silver gold glittering shining dull thin
    thick/, 'dog eared', 'light green', 'dark green', 'light blue',
    'dark blue', 'light brown', 'dark brown',
);

sub _list {
    my $spellbooks = {
        'Book of the Dead' => {
            artifact   => 1,
            price      => 10000,
            weight     => 20,
            level      => 7,
            time       => 0,
            ink        => 0,
            fullname   => 'The Book of the Dead',
            appearance => 'papyrus spellbook',
            emergency  => 0,
        },

        'spellbook of blank paper' => {
            price      => 0,
            level      => 0,
            time       => 0,
            ink        => 0,
            appearance => 'plain spellbook',
            emergency  => 0,
        },

        'spellbook of force bolt' => {
            price     => 100,
            level     => 1,
            time      => 2,
            ink       => 10,
            emergency => 0,
            skill     => 'attack',
            direction => 'beam',
        },
        'spellbook of drain life' => {
            price     => 200,
            level     => 2,
            time      => 2,
            ink       => 20,
            emergency => 0,
            skill     => 'attack',
            direction => 'beam',
        },
        'spellbook of magic missile' => {
            price     => 200,
            level     => 2,
            time      => 2,
            ink       => 20,
            role      => 'Wiz',
            emergency => 0,
            skill     => 'attack',
            direction => 'ray',
        },
        'spellbook of cone of cold' => {
            price     => 400,
            level     => 4,
            time      => 21,
            ink       => 40,
            role      => 'Val',
            emergency => 0,
            skill     => 'attack',
            direction => {
                unskilled => 'ray',
                basic     => 'ray',
                skilled   => 'distant',
                expert    => 'distant',
            },
        },
        'spellbook of fireball' => {
            price     => 400,
            level     => 4,
            time      => 12,
            ink       => 40,
            emergency => 0,
            skill     => 'attack',
            direction => {
                unskilled => 'ray',
                basic     => 'ray',
                skilled   => 'distant',
                expert    => 'distant',
            },
        },
        'spellbook of finger of death' => {
            price     => 700,
            level     => 7,
            time      => 80,
            ink       => 70,
            emergency => 0,
            skill     => 'attack',
            direction => 'ray',
        },
        'spellbook of healing' => {
            price     => 100,
            level     => 1,
            time      => 2,
            ink       => 10,
            emergency => 1,
            skill     => 'healing',
            direction => 'beam',
        },
        'spellbook of cure blindness' => {
            price     => 200,
            level     => 2,
            time      => 2,
            ink       => 20,
            emergency => 1,
            skill     => 'healing',
            direction => 'nodir',
        },
        'spellbook of cure sickness' => {
            price     => 300,
            level     => 3,
            time      => 6,
            ink       => 30,
            role      => 'Hea',
            emergency => 1,
            skill     => 'healing',
            direction => 'nodir',
        },
        'spellbook of extra healing' => {
            price     => 300,
            level     => 3,
            time      => 10,
            ink       => 30,
            emergency => 1,
            skill     => 'healing',
            direction => 'beam',
        },
        'spellbook of stone to flesh' => {
            price     => 300,
            level     => 3,
            time      => 2,
            ink       => 30,
            emergency => 0,
            skill     => 'healing',
            direction => 'beam',
        },
        'spellbook of restore ability' => {
            price     => 400,
            level     => 4,
            time      => 15,
            ink       => 40,
            role      => 'Mon',
            emergency => 1,
            skill     => 'healing',
            direction => 'nodir',
        },
        'spellbook of detect monsters' => {
            price     => 100,
            level     => 1,
            time      => 1,
            ink       => 10,
            emergency => 0,
            skill     => 'divination',
            direction => 'nodir',
        },
        'spellbook of light' => {
            price     => 100,
            level     => 1,
            time      => 1,
            ink       => 10,
            emergency => 0,
            skill     => 'divination',
            direction => 'nodir',
        },
        'spellbook of detect food' => {
            price     => 200,
            level     => 2,
            time      => 3,
            ink       => 20,
            emergency => 0,
            skill     => 'divination',
            direction => 'nodir',
        },
        'spellbook of clairvoyance' => {
            price     => 300,
            level     => 3,
            time      => 6,
            ink       => 30,
            role      => 'Sam',
            emergency => 0,
            skill     => 'divination',
            direction => 'nodir',
        },
        'spellbook of detect unseen' => {
            price     => 300,
            level     => 3,
            time      => 8,
            ink       => 30,
            emergency => 0,
            skill     => 'divination',
            direction => 'nodir',
        },
        'spellbook of identify' => {
            price     => 300,
            level     => 3,
            time      => 12,
            ink       => 30,
            emergency => 0,
            skill     => 'divination',
            direction => 'nodir',
        },
        'spellbook of detect treasure' => {
            price     => 400,
            level     => 4,
            time      => 15,
            ink       => 40,
            role      => 'Rog',
            emergency => 0,
            skill     => 'divination',
            direction => 'nodir',
        },
        'spellbook of magic mapping' => {
            price     => 500,
            level     => 5,
            time      => 35,
            ink       => 50,
            role      => 'Arc',
            emergency => 0,
            skill     => 'divination',
            direction => 'nodir',
        },
        'spellbook of sleep' => {
            price     => 100,
            level     => 1,
            time      => 1,
            ink       => 10,
            emergency => 0,
            skill     => 'enchantment',
            direction => 'ray',
        },
        'spellbook of confuse monster' => {
            price     => 200,
            level     => 2,
            time      => 2,
            ink       => 20,
            emergency => 0,
            skill     => 'enchantment',
            direction => 'nodir',
        },
        'spellbook of slow monster' => {
            price     => 200,
            level     => 2,
            time      => 2,
            ink       => 20,
            emergency => 0,
            skill     => 'enchantment',
            direction => 'beam',
        },
        'spellbook of cause fear' => {
            price     => 300,
            level     => 3,
            time      => 6,
            ink       => 30,
            emergency => 0,
            skill     => 'enchantment',
            direction => 'nodir',
        },
        'spellbook of charm monster' => {
            price     => 300,
            level     => 3,
            time      => 6,
            ink       => 30,
            role      => 'Tou',
            emergency => 0,
            skill     => 'enchantment',
            direction => 'nodir',
        },
        'spellbook of protection' => {
            price     => 100,
            level     => 1,
            time      => 3,
            ink       => 10,
            emergency => 0,
            skill     => 'clerical',
            direction => 'nodir',
        },
        'spellbook of create monster' => {
            price     => 200,
            level     => 2,
            time      => 3,
            ink       => 20,
            emergency => 0,
            skill     => 'clerical',
            direction => 'nodir',
        },
        'spellbook of remove curse' => {
            price     => 300,
            level     => 3,
            time      => 10,
            ink       => 30,
            role      => 'Pri',
            emergency => 1,
            skill     => 'clerical',
            direction => 'nodir',
        },
        'spellbook of create familiar' => {
            price     => 600,
            level     => 6,
            time      => 42,
            ink       => 60,
            emergency => 0,
            skill     => 'clerical',
            direction => 'nodir',
        },
        'spellbook of turn undead' => {
            price     => 600,
            level     => 6,
            time      => 48,
            ink       => 60,
            role      => 'Kni',
            emergency => 0,
            skill     => 'clerical',
            direction => 'beam',
        },
        'spellbook of jumping' => {
            price     => 100,
            level     => 1,
            time      => 3,
            ink       => 10,
            emergency => 0,
            skill     => 'escape',
            direction => 'jump',
        },
        'spellbook of haste self' => {
            price     => 300,
            level     => 3,
            time      => 8,
            ink       => 30,
            role      => 'Bar',
            emergency => 0,
            skill     => 'escape',
            direction => 'nodir',
        },
        'spellbook of invisibility' => {
            price     => 400,
            level     => 4,
            time      => 15,
            ink       => 40,
            role      => 'Ran',
            emergency => 0,
            skill     => 'escape',
            direction => 'nodir',
        },
        'spellbook of levitation' => {
            price     => 400,
            level     => 4,
            time      => 12,
            ink       => 40,
            emergency => 0,
            skill     => 'escape',
            direction => 'nodir',
        },
        'spellbook of teleport away' => {
            price     => 600,
            level     => 6,
            time      => 36,
            ink       => 60,
            emergency => 0,
            skill     => 'escape',
            direction => 'beam',
        },
        'spellbook of knock' => {
            price     => 100,
            level     => 1,
            time      => 1,
            ink       => 10,
            emergency => 0,
            skill     => 'matter',
            direction => 'beam',
        },
        'spellbook of wizard lock' => {
            price     => 200,
            level     => 2,
            time      => 3,
            ink       => 20,
            emergency => 0,
            skill     => 'matter',
            direction => 'beam',
        },
        'spellbook of dig' => {
            price     => 500,
            level     => 5,
            time      => 30,
            ink       => 50,
            role      => 'Cav',
            emergency => 0,
            skill     => 'matter',
            direction => 'ray',
        },
        'spellbook of polymorph' => {
            price     => 600,
            level     => 6,
            time      => 48,
            ink       => 60,
            emergency => 0,
            skill     => 'matter',
            direction => 'beam',
        },
        'spellbook of cancellation' => {
            price     => 700,
            level     => 7,
            time      => 64,
            ink       => 70,
            emergency => 0,
            skill     => 'matter',
            direction => 'beam',
        },
    };

    return $spellbooks, (weight => 50, material => 'paper', glyph => '+',
                         appearances => \@spellbooks);
}

1;

