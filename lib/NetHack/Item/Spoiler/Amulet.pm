#!/usr/bin/env perl
package NetHack::Item::Spoiler::Amulet;
use strict;
use warnings;
use base 'NetHack::Item::Spoiler';

my @amulets = map { "$_ amulet" } (
    qw/circular spherical oval triangular pyramidal square concave hexagonal
    octagonal/
);

sub _list {
    my $amulets = {
        'Eye of the Aethiopica' => {
            price    => 4000,
            edible   => 1,
            artifact => 1,
            base     => 'amulet of ESP',
        },
        'Amulet of Yendor' => {
            price    => 30000,
            artifact => 1,
        },
        'cheap plastic imitation of the Amulet of Yendor' => {
            price      => 0,
            appearance => 'Amulet of Yendor',
        },

        'amulet of change' => {
            price  => 150,
            edible => 1,
        },
        'amulet of ESP' => {
            price  => 150,
            edible => 1,
        },
        'amulet of life saving' => {
            price  => 150,
        },
        'amulet of magical breathing' => {
            price  => 150,
            edible => 1,
        },
        'amulet of reflection' => {
            price  => 150,
        },
        'amulet of restful sleep' => {
            price  => 150,
            edible => 1,
        },
        'amulet of strangulation' => {
            price  => 150,
            edible => 1,
        },
        'amulet of unchanging' => {
            price  => 150,
            edible => 1,
        },
        'amulet versus poison' => {
            price  => 150,
            edible => 1,
        },
    };

    return $amulets, (weight => 20, appearances => \@amulets);
}

1;

