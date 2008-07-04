#!/usr/bin/env perl
package NetHack::Item::Spoiler::Other;
use strict;
use warnings;
use base 'NetHack::Item::Spoiler';

use Memoize;
memoize 'list';

sub list {
    my $others = {
        'gold piece' => {
            price  => 1,
            weight => 0.01,
            glyph  => '$',
            plural => 'gold pieces',
        },
        'boulder' => {
            price     => 0,
            weight    => 6000,
            glyph     => '0',
            sdam      => 'd20',
            ldam      => 'd20',
            nutrition => 2000,
            plural    => 'boulders',
        },
        'statue' => {
            price     => 0,
            weight    => 900,
            glyph     => '`',
            sdam      => 'd20',
            ldam      => 'd20',
            nutrition => 2500,
            plural    => 'statues',
        },
        'heavy iron ball' => {
            price     => 10,
            weight    => 480,
            glyph     => '0',
            sdam      => 'd25',
            ldam      => 'd25',
            nutrition => 480,
            plural    => 'heavy iron balls',
        },
        'iron chain' => {
            price     => 0,
            weight    => 120,
            glyph     => '_',
            sdam      => 'd4+1',
            ldam      => 'd4+1',
            nutrition => 120,
            plural    => 'iron chains',
        },
        'acid venom' => {
            price  => 0,
            weight => 1,
            glyph  => '.',
            sdam   => '2d6',
            ldam   => '2d6',
            plural => 'acid venoms',
        },
        'blinding venom' => {
            price  => 0,
            weight => 1,
            glyph  => '.',
            plural => 'blinding venoms',
        },
    };

    # tag each other with its name, weight, appearances, etc
    for my $name (keys %$others) {
        my $stats = $others->{$name};
        $stats->{name}       = $name;
        $stats->{type}       = 'other';
        $stats->{appearance} = $name
            unless $stats->{appearance} || $stats->{appearances};
    }

    return $others;
}

1;

