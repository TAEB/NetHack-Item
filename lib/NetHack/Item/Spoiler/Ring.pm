
#!/usr/bin/env perl
package NetHack::Item::Spoiler::Ring;
use strict;
use warnings;
use base 'NetHack::Item::Spoiler';

use constant type => 'ring';

my @rings = map { "$_ ring" } (
    qw/wooden granite opal clay coral moonstone jade bronze agate topaz
    sapphire ruby diamond pearl iron brass copper twisted steel silver gold
    ivory emerald wire engagement shiny/, 'black onyx', 'tiger eye'
);

sub _list {
    my $rings = {
        'ring of adornment' => {
            price      => 100,
            chargeable => 1,
        },
        'ring of hunger' => {
            price      => 100,
            chargeable => 0,
        },
        'ring of protection' => {
            price      => 100,
            chargeable => 1,
        },
        'ring of protection from shape changers' => {
            price      => 100,
            chargeable => 0,
        },
        'ring of stealth' => {
            price      => 100,
            chargeable => 0,
        },
        'ring of sustain ability' => {
            price      => 100,
            chargeable => 0,
        },
        'ring of warning' => {
            price      => 100,
            chargeable => 0,
        },
        'ring of aggravate monster' => {
            price      => 150,
            chargeable => 0,
        },
        'ring of cold resistance' => {
            price      => 150,
            chargeable => 0,
        },
        'ring of gain constitution' => {
            price      => 150,
            chargeable => 1,
        },
        'ring of gain strength' => {
            price      => 150,
            chargeable => 1,
        },
        'ring of increase accuracy' => {
            price      => 150,
            chargeable => 1,
        },
        'ring of increase damage' => {
            price      => 150,
            chargeable => 1,
        },
        'ring of invisibility' => {
            price      => 150,
            chargeable => 0,
        },
        'ring of poison resistance' => {
            price      => 150,
            chargeable => 0,
        },
        'ring of see invisible' => {
            price      => 150,
            chargeable => 0,
        },
        'ring of shock resistance' => {
            price      => 150,
            chargeable => 0,
        },
        'ring of fire resistance' => {
            price      => 200,
            chargeable => 0,
        },
        'ring of free action' => {
            price      => 200,
            chargeable => 0,
        },
        'ring of levitation' => {
            price      => 200,
            chargeable => 0,
        },
        'ring of regeneration' => {
            price      => 200,
            chargeable => 0,
        },
        'ring of searching' => {
            price      => 200,
            chargeable => 0,
        },
        'ring of slow digestion' => {
            price      => 200,
            chargeable => 0,
        },
        'ring of teleportation' => {
            price      => 200,
            chargeable => 0,
        },
        'ring of conflict' => {
            price      => 300,
            chargeable => 0,
        },
        'ring of polymorph' => {
            price      => 300,
            chargeable => 0,
        },
        'ring of polymorph control' => {
            price      => 300,
            chargeable => 0,
        },
        'ring of teleport control' => {
            price      => 300,
            chargeable => 0,
        },
    };

    return $rings, (weight => 3, appearances => \@rings);
}

1;

