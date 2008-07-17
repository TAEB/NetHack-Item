#!/usr/bin/env perl
package NetHack::Item::Spoiler::Potion;
use strict;
use warnings;
use base 'NetHack::Item::Spoiler';

use Memoize;
memoize 'list';

my @potions = map { "$_ potion" } (
    qw/ruby pink orange yellow emerald cyan magenta purple-red puce milky
    swirly bubbly smoky cloudy effervescent black golden brown fizzy dark white
    murky/, 'dark green', 'sky blue', 'brilliant blue',
);

sub list {
    my $potions = {
        'potion of booze' => {
            price => 50,
        },
        'potion of fruit juice' => {
            price => 50,
        },
        'potion of see invisible' => {
            price => 50,
        },
        'potion of sickness' => {
            price => 50,
        },
        'potion of confusion' => {
            price => 100,
        },
        'potion of extra healing' => {
            price => 100,
        },
        'potion of hallucination' => {
            price => 100,
        },
        'potion of healing' => {
            price => 100,
        },
        'potion of restore ability' => {
            price => 100,
        },
        'potion of sleeping' => {
            price => 100,
        },
        'potion of water' => {
            price       => 100,
            appearance  => 'clear potion',
        },
        'potion of blindness' => {
            price => 150,
        },
        'potion of gain energy' => {
            price => 150,
        },
        'potion of invisibility' => {
            price => 150,
        },
        'potion of monster detection' => {
            price => 150,
        },
        'potion of object detection' => {
            price => 150,
        },
        'potion of enlightenment' => {
            price => 200,
        },
        'potion of full healing' => {
            price => 200,
        },
        'potion of levitation' => {
            price => 200,
        },
        'potion of polymorph' => {
            price => 200,
        },
        'potion of speed' => {
            price => 200,
        },
        'potion of acid' => {
            price => 250,
        },
        'potion of oil' => {
            price => 250,
        },
        'potion of gain ability' => {
            price => 300,
        },
        'potion of gain level' => {
            price => 300,
        },
        'potion of paralysis' => {
            price => 300,
        },
    };

    return $potions, (
        weight      => 20,
        appearances => \@potions,
        plural      => sub {
            my $name = shift;
            $name =~ s/\bpotion\b/potions/;
            return $name;
        },
    );
}

sub extra_plurals {
    my $self = shift;
    my %extra;

    for (@potions, 'clear potion') {
        (my $plural = $_) =~ s/\bpotion\b/potions/;
        $extra{$_} = $plural;
    }

    return \%extra;
}

1;

