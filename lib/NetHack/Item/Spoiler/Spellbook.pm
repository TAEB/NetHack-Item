#!/usr/bin/env perl
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
            read       => 0,
            ink        => 0,
            fullname   => 'The Book of the Dead',
            appearance => 'papyrus spellbook',
        },

        'spellbook of blank paper' => {
            price      => 0,
            level      => 0,
            read       => 0,
            ink        => 0,
            appearance => 'plain spellbook',
        },

        'spellbook of force bolt' => {
            price  => 100,
            level  => 1,
            read   => 2,
            ink    => 10,
        },
        'spellbook of drain life' => {
            price  => 200,
            level  => 2,
            read   => 2,
            ink    => 20,
        },
        'spellbook of magic missile' => {
            price  => 200,
            level  => 2,
            read   => 2,
            ink    => 20,
            role   => 'Wiz',
        },
        'spellbook of cone of cold' => {
            price  => 400,
            level  => 4,
            read   => 21,
            ink    => 40,
            role   => 'Val',
        },
        'spellbook of fireball' => {
            price  => 400,
            level  => 4,
            read   => 12,
            ink    => 40,
        },
        'spellbook of finger of death' => {
            price  => 700,
            level  => 7,
            read   => 80,
            ink    => 70,
        },
        'spellbook of healing' => {
            price     => 100,
            level     => 1,
            read      => 2,
            ink       => 10,
            emergency => 1,
        },
        'spellbook of cure blindness' => {
            price     => 200,
            level     => 2,
            read      => 2,
            ink       => 20,
            emergency => 1,
        },
        'spellbook of cure sickness' => {
            price     => 300,
            level     => 3,
            read      => 6,
            ink       => 30,
            role      => 'Hea',
            emergency => 1,
        },
        'spellbook of extra healing' => {
            price     => 300,
            level     => 3,
            read      => 10,
            ink       => 30,
            emergency => 1,
        },
        'spellbook of stone to flesh' => {
            price  => 300,
            level  => 3,
            read   => 2,
            ink    => 30,
        },
        'spellbook of restore ability' => {
            price     => 400,
            level     => 4,
            read      => 15,
            ink       => 40,
            role      => 'Mon',
            emergency => 1,
        },
        'spellbook of detect monsters' => {
            price  => 100,
            level  => 1,
            read   => 1,
            ink    => 10,
        },
        'spellbook of light' => {
            price  => 100,
            level  => 1,
            read   => 1,
            ink    => 10,
        },
        'spellbook of detect food' => {
            price  => 200,
            level  => 2,
            read   => 3,
            ink    => 20,
        },
        'spellbook of clairvoyance' => {
            price  => 300,
            level  => 3,
            read   => 6,
            ink    => 30,
            role   => 'Sam',
        },
        'spellbook of detect unseen' => {
            price  => 300,
            level  => 3,
            read   => 8,
            ink    => 30,
        },
        'spellbook of identify' => {
            price  => 300,
            level  => 3,
            read   => 12,
            ink    => 30,
        },
        'spellbook of detect treasure' => {
            price  => 400,
            level  => 4,
            read   => 15,
            ink    => 40,
            role   => 'Rog',
        },
        'spellbook of magic mapping' => {
            price  => 500,
            level  => 5,
            read   => 35,
            ink    => 50,
            role   => 'Arc',
        },
        'spellbook of sleep' => {
            price  => 100,
            level  => 1,
            read   => 1,
            ink    => 10,
        },
        'spellbook of confuse monster' => {
            price  => 200,
            level  => 2,
            read   => 2,
            ink    => 20,
        },
        'spellbook of slow monster' => {
            price  => 200,
            level  => 2,
            read   => 2,
            ink    => 20,
        },
        'spellbook of cause fear' => {
            price  => 300,
            level  => 3,
            read   => 6,
            ink    => 30,
        },
        'spellbook of charm monster' => {
            price  => 300,
            level  => 3,
            read   => 6,
            ink    => 30,
            role   => 'Tou',
        },
        'spellbook of protection' => {
            price  => 100,
            level  => 1,
            read   => 3,
            ink    => 10,
        },
        'spellbook of create monster' => {
            price  => 200,
            level  => 2,
            read   => 3,
            ink    => 20,
        },
        'spellbook of remove curse' => {
            price     => 300,
            level     => 3,
            read      => 10,
            ink       => 30,
            role      => 'Pri',
            emergency => 1,
        },
        'spellbook of create familiar' => {
            price  => 600,
            level  => 6,
            read   => 42,
            ink    => 60,
        },
        'spellbook of turn undead' => {
            price  => 600,
            level  => 6,
            read   => 48,
            ink    => 60,
            role   => 'Kni',
        },
        'spellbook of jumping' => {
            price  => 100,
            level  => 1,
            read   => 3,
            ink    => 10,
        },
        'spellbook of haste self' => {
            price  => 300,
            level  => 3,
            read   => 8,
            ink    => 30,
            role   => 'Bar',
        },
        'spellbook of invisibility' => {
            price  => 400,
            level  => 4,
            read   => 15,
            ink    => 40,
            role   => 'Ran',
        },
        'spellbook of levitation' => {
            price  => 400,
            level  => 4,
            read   => 12,
            ink    => 40,
        },
        'spellbook of teleport away' => {
            price  => 600,
            level  => 6,
            read   => 36,
            ink    => 60,
        },
        'spellbook of knock' => {
            price  => 100,
            level  => 1,
            read   => 1,
            ink    => 10,
        },
        'spellbook of wizard lock' => {
            price  => 200,
            level  => 2,
            read   => 3,
            ink    => 20,
        },
        'spellbook of dig' => {
            price  => 500,
            level  => 5,
            read   => 30,
            ink    => 50,
            role   => 'Cav',
        },
        'spellbook of polymorph' => {
            price  => 600,
            level  => 6,
            read   => 48,
            ink    => 60,
        },
        'spellbook of cancellation' => {
            price  => 700,
            level  => 7,
            read   => 64,
            ink    => 70,
        },
    };

    return $spellbooks, (weight => 50, appearances => \@spellbooks);
}

1;

