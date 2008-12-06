#!/usr/bin/env perl
package NetHack::Item::Spoiler::Wand;
use strict;
use warnings;
use base 'NetHack::Item::Spoiler';

use constant type => 'wand';

my @wands = map { "$_ wand" }
    qw/glass balsa crystal maple pine oak ebony marble tin brass copper silver
    platinum iridium zinc aluminum uranium iron steel hexagonal short runed
    long curved forked spiked jeweled/;

sub _list {
    my $wands = {
        'wand of light' => {
            price      => 100,
            maxcharges => 15,
            zaptype    => 'nodir',
        },
        'wand of nothing' => {
            price      => 100,
            maxcharges => 15,
            zaptype    => 'beam',
        },
        'wand of digging' => {
            price      => 150,
            maxcharges => 8,
            zaptype    => 'ray',
        },
        'wand of enlightenment' => {
            price      => 150,
            maxcharges => 15,
            zaptype    => 'nodir',
        },
        'wand of locking' => {
            price      => 150,
            maxcharges => 8,
            zaptype    => 'beam',
        },
        'wand of magic missile' => {
            price      => 150,
            maxcharges => 8,
            zaptype    => 'ray',
        },
        'wand of make invisible' => {
            price      => 150,
            maxcharges => 8,
            zaptype    => 'beam',
        },
        'wand of opening' => {
            price      => 150,
            maxcharges => 8,
            zaptype    => 'beam',
        },
        'wand of probing' => {
            price      => 150,
            maxcharges => 8,
            zaptype    => 'beam',
        },
        'wand of secret door detection' => {
            price      => 150,
            maxcharges => 15,
            zaptype    => 'nodir',
        },
        'wand of slow monster' => {
            price      => 150,
            maxcharges => 8,
            zaptype    => 'beam',
        },
        'wand of speed monster' => {
            price      => 150,
            maxcharges => 8,
            zaptype    => 'beam',
        },
        'wand of striking' => {
            price      => 150,
            maxcharges => 8,
            zaptype    => 'beam',
        },
        'wand of undead turning' => {
            price      => 150,
            maxcharges => 8,
            zaptype    => 'beam',
        },
        'wand of cold' => {
            price      => 175,
            maxcharges => 8,
            zaptype    => 'ray',
        },
        'wand of fire' => {
            price      => 175,
            maxcharges => 8,
            zaptype    => 'ray',
        },
        'wand of lightning' => {
            price      => 175,
            maxcharges => 8,
            zaptype    => 'ray',
        },
        'wand of sleep' => {
            price      => 175,
            maxcharges => 8,
            zaptype    => 'ray',
        },
        'wand of cancellation' => {
            price      => 200,
            maxcharges => 8,
            zaptype    => 'beam',
        },
        'wand of create monster' => {
            price      => 200,
            maxcharges => 15,
            zaptype    => 'nodir',
        },
        'wand of polymorph' => {
            price      => 200,
            maxcharges => 8,
            zaptype    => 'beam',
        },
        'wand of teleportation' => {
            price      => 200,
            maxcharges => 8,
            zaptype    => 'beam',
        },
        'wand of death' => {
            price      => 500,
            maxcharges => 8,
            zaptype    => 'ray',
        },
        'wand of wishing' => {
            price      => 500,
            maxcharges => 3,
            zaptype    => 'nodir',
        },
    };

    return $wands, (weight => 7, appearances => \@wands);
}

1;

