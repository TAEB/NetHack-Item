#!/usr/bin/env perl
package NetHack::Item::Spoiler::Spellbook;
use strict;
use warnings;
use base 'NetHack::Item::Spoiler';

use Memoize;
memoize 'list';

my @spellbooks = map { "$_ spellbook" } (
    qw/parchment vellum ragged mottled stained cloth leather white pink red
    orange yellow velvet turquoise cyan indigo magenta purple violet tan plaid
    gray wrinkled dusty bronze copper silver gold glittering shining dull thin
    thick/, 'dog eared', 'light green', 'dark green', 'light blue', 'dark
    blue', 'light brown', 'dark brown',
);

sub list {
    my $spellbooks = {
        'Book of the Dead' => {
            artifact   => 1,
            price      => 10000,
            weight     => 20,
            level      => 7,
            read       => 0,
            marker     => 0,
            appearance => 'papyrus spellbook',
        },

        'spellbook of blank paper' => {
            price      => 0,
            level      => 0,
            read       => 0,
            marker     => 0,
            appearance => 'plain spellbook',
        },

        'spellbook of force bolt' => {
            price  => 100,
            level  => 1,
            read   => 2,
            marker => 10,
        },
        'spellbook of drain life' => {
            price  => 200,
            level  => 2,
            read   => 2,
            marker => 20,
        },
        'spellbook of magic missile' => {
            price  => 200,
            level  => 2,
            read   => 2,
            marker => 20,
            role   => 'Wiz',
        },
        'spellbook of cone of cold' => {
            price  => 400,
            level  => 4,
            read   => 21,
            marker => 40,
            role   => 'Val',
        },
        'spellbook of fireball' => {
            price  => 400,
            level  => 4,
            read   => 12,
            marker => 40,
        },
        'spellbook of finger of death' => {
            price  => 700,
            level  => 7,
            read   => 80,
            marker => 70,
        },
        'spellbook of healing' => {
            price     => 100,
            level     => 1,
            read      => 2,
            marker    => 10,
            emergency => 1,
        },
        'spellbook of cure blindness' => {
            price     => 200,
            level     => 2,
            read      => 2,
            marker    => 20,
            emergency => 1,
        },
        'spellbook of cure sickness' => {
            price     => 300,
            level     => 3,
            read      => 6,
            marker    => 30,
            role      => 'Hea',
            emergency => 1,
        },
        'spellbook of extra healing' => {
            price     => 300,
            level     => 3,
            read      => 10,
            marker    => 30,
            emergency => 1,
        },
        'spellbook of stone to flesh' => {
            price  => 300,
            level  => 3,
            read   => 2,
            marker => 30,
        },
        'spellbook of restore ability' => {
            price     => 400,
            level     => 4,
            read      => 15,
            marker    => 40,
            role      => 'Mon',
            emergency => 1,
        },
        'spellbook of detect monsters' => {
            price  => 100,
            level  => 1,
            read   => 1,
            marker => 10,
        },
        'spellbook of light' => {
            price  => 100,
            level  => 1,
            read   => 1,
            marker => 10,
        },
        'spellbook of detect food' => {
            price  => 200,
            level  => 2,
            read   => 3,
            marker => 20,
        },
        'spellbook of clairvoyance' => {
            price  => 300,
            level  => 3,
            read   => 6,
            marker => 30,
            role   => 'Sam',
        },
        'spellbook of detect unseen' => {
            price  => 300,
            level  => 3,
            read   => 8,
            marker => 30,
        },
        'spellbook of identify' => {
            price  => 300,
            level  => 3,
            read   => 12,
            marker => 30,
        },
        'spellbook of detect treasure' => {
            price  => 400,
            level  => 4,
            read   => 15,
            marker => 40,
            role   => 'Rog',
        },
        'spellbook of magic mapping' => {
            price  => 500,
            level  => 5,
            read   => 35,
            marker => 50,
            role   => 'Arc',
        },
        'spellbook of sleep' => {
            price  => 100,
            level  => 1,
            read   => 1,
            marker => 10,
        },
        'spellbook of confuse monster' => {
            price  => 200,
            level  => 2,
            read   => 2,
            marker => 20,
        },
        'spellbook of slow monster' => {
            price  => 200,
            level  => 2,
            read   => 2,
            marker => 20,
        },
        'spellbook of cause fear' => {
            price  => 300,
            level  => 3,
            read   => 6,
            marker => 30,
        },
        'spellbook of charm monster' => {
            price  => 300,
            level  => 3,
            read   => 6,
            marker => 30,
            role   => 'Tou',
        },
        'spellbook of protection' => {
            price  => 100,
            level  => 1,
            read   => 3,
            marker => 10,
        },
        'spellbook of create monster' => {
            price  => 200,
            level  => 2,
            read   => 3,
            marker => 20,
        },
        'spellbook of remove curse' => {
            price     => 300,
            level     => 3,
            read      => 10,
            marker    => 30,
            role      => 'Pri',
            emergency => 1,
        },
        'spellbook of create familiar' => {
            price  => 600,
            level  => 6,
            read   => 42,
            marker => 60,
        },
        'spellbook of turn undead' => {
            price  => 600,
            level  => 6,
            read   => 48,
            marker => 60,
            role   => 'Kni',
        },
        'spellbook of jumping' => {
            price  => 100,
            level  => 1,
            read   => 3,
            marker => 10,
        },
        'spellbook of haste self' => {
            price  => 300,
            level  => 3,
            read   => 8,
            marker => 30,
            role   => 'Bar',
        },
        'spellbook of invisibility' => {
            price  => 400,
            level  => 4,
            read   => 15,
            marker => 40,
            role   => 'Ran',
        },
        'spellbook of levitation' => {
            price  => 400,
            level  => 4,
            read   => 12,
            marker => 40,
        },
        'spellbook of teleport away' => {
            price  => 600,
            level  => 6,
            read   => 36,
            marker => 60,
        },
        'spellbook of knock' => {
            price  => 100,
            level  => 1,
            read   => 1,
            marker => 10,
        },
        'spellbook of wizard lock' => {
            price  => 200,
            level  => 2,
            read   => 3,
            marker => 20,
        },
        'spellbook of dig' => {
            price  => 500,
            level  => 5,
            read   => 30,
            marker => 50,
            role   => 'Cav',
        },
        'spellbook of polymorph' => {
            price  => 600,
            level  => 6,
            read   => 48,
            marker => 60,
        },
        'spellbook of cancellation' => {
            price  => 700,
            level  => 7,
            read   => 64,
            marker => 70,
        },
    };

    # tag each spellbook with its name, weight, appearances, etc
    for my $name (keys %$spellbooks) {
        my $stats = $spellbooks->{$name};
        $stats->{name}        = $name;
        $stats->{type}        = 'spellbook';
        $stats->{weight}    ||= 50;
        $stats->{appearances} = \@spellbooks
            unless $stats->{appearance} || $stats->{appearances};
    }

    return $spellbooks;
}

1;

