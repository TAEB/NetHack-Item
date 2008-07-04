#!/usr/bin/env perl
package NetHack::Item::Spoiler::Wand;
use strict;
use warnings;
use base 'NetHack::Item::Spoiler';

use Memoize;
memoize 'list';

my @wands = map { "$_ wand" }
    qw/glass balsa crystal maple pine oak ebony marble tin brass copper silver
    platinum iridium zinc aluminum uranium iron steel hexagonal short runed
    long curved forked spiked jeweled/;

sub list {
    my $wands = {
        'wand of light' => {
            price      => 100,
            maxcharges => 15,
            type       => 'nodir',
        },
        'wand of nothing' => {
            price      => 100,
            maxcharges => 15,
            type       => 'beam',
        },
        'wand of digging' => {
            price      => 150,
            maxcharges => 8,
            type       => 'ray',
        },
        'wand of enlightenment' => {
            price      => 150,
            maxcharges => 15,
            type       => 'nodir',
        },
        'wand of locking' => {
            price      => 150,
            maxcharges => 8,
            type       => 'beam',
        },
        'wand of magic missile' => {
            price      => 150,
            maxcharges => 8,
            type       => 'ray',
        },
        'wand of make invisible' => {
            price      => 150,
            maxcharges => 8,
            type       => 'beam',
        },
        'wand of opening' => {
            price      => 150,
            maxcharges => 8,
            type       => 'beam',
        },
        'wand of probing' => {
            price      => 150,
            maxcharges => 8,
            type       => 'beam',
        },
        'wand of secret door detection' => {
            price      => 150,
            maxcharges => 15,
            type       => 'nodir',
        },
        'wand of slow monster' => {
            price      => 150,
            maxcharges => 8,
            type       => 'beam',
        },
        'wand of speed monster' => {
            price      => 150,
            maxcharges => 8,
            type       => 'beam',
        },
        'wand of striking' => {
            price      => 150,
            maxcharges => 8,
            type       => 'beam',
        },
        'wand of undead turning' => {
            price      => 150,
            maxcharges => 8,
            type       => 'beam',
        },
        'wand of cold' => {
            price      => 175,
            maxcharges => 8,
            type       => 'ray',
        },
        'wand of fire' => {
            price      => 175,
            maxcharges => 8,
            type       => 'ray',
        },
        'wand of lightning' => {
            price      => 175,
            maxcharges => 8,
            type       => 'ray',
        },
        'wand of sleep' => {
            price      => 175,
            maxcharges => 8,
            type       => 'ray',
        },
        'wand of cancellation' => {
            price      => 200,
            maxcharges => 8,
            type       => 'beam',
        },
        'wand of create monster' => {
            price      => 200,
            maxcharges => 15,
            type       => 'nodir',
        },
        'wand of polymorph' => {
            price      => 200,
            maxcharges => 8,
            type       => 'beam',
        },
        'wand of teleportation' => {
            price      => 200,
            maxcharges => 8,
            type       => 'beam',
        },
        'wand of death' => {
            price      => 500,
            maxcharges => 8,
            type       => 'ray',
        },
        'wand of wishing' => {
            price      => 500,
            maxcharges => 3,
            type       => 'nodir',
        },
    };

    # tag each wand with its name, weight, appearances, etc
    for my $name (keys %$wands) {
        my $stats = $wands->{$name};
        $stats->{name}        = $name;
        $stats->{type}        = 'wand';
        $stats->{weight}    ||= 7;
        $stats->{appearances} = \@wands
            unless $stats->{appearance} || $stats->{appearances};
    }

    return $wands;
}

1;

