#!/usr/bin/env perl
package NetHack::Item::Spoiler::Amulet;
use strict;
use warnings;
use base 'NetHack::Item::Spoiler';

use constant type => 'amulet';

my @amulets = map { "$_ amulet" } (
    qw/circular spherical oval triangular pyramidal square concave hexagonal
    octagonal/
);

sub _list {
    my $amulets = {
        'Amulet of Yendor' => {
            price    => 30000,
            artifact => 1,
            fullname => 'The Amulet of Yendor',
            appearance => 'Amulet of Yendor',
        },

        'Eye of the Aethiopica' => {
            price    => 4000,
            edible   => 1,
            artifact => 1,
            fullname => 'The Eye of the Aethiopica',
            base     => 'amulet of ESP',
        },

        'cheap plastic imitation of the Amulet of Yendor' => {
            price      => 0,
            appearance => 'Amulet of Yendor',
        },

        'amulet of change' => {
            edible => 1,
        },
        'amulet of ESP' => {
            edible => 1,
        },
        'amulet of life saving' => {
        },
        'amulet of magical breathing' => {
            edible => 1,
        },
        'amulet of reflection' => {
        },
        'amulet of restful sleep' => {
            edible => 1,
        },
        'amulet of strangulation' => {
            edible => 1,
        },
        'amulet of unchanging' => {
            edible => 1,
        },
        'amulet versus poison' => {
            edible => 1,
        },
    };

    return $amulets, (weight => 20, price => 150, appearances => \@amulets);
}

1;

