package NetHack::Item::Spoiler::Gem;
use strict;
use warnings;
use base 'NetHack::Item::Spoiler';

use constant type => 'gem';

sub _list {
    my $gems = {
        'Heart of Ahriman' => {
            artifact   => 1,
            base       => 'luckstone',
            price      => 2500,
            weight     => 10,
            hardness   => 'soft',
            fullname   => 'The Heart of Ahriman',
            appearance => 'gray stone',
            material   => 'mineral',
        },

        'dilithium crystal' => {
            price      => 4500,
            hardness   => 'soft',
            appearance => 'white gem',
            plural     => 'dilithium crystals',
            material   => 'gemstone',
        },
        'diamond' => {
            price      => 4000,
            hardness   => 'hard',
            appearance => 'white gem',
            plural     => 'diamonds',
            material   => 'gemstone',
        },
        'ruby' => {
            price      => 3500,
            hardness   => 'hard',
            appearance => 'red gem',
            plural     => 'rubies',
            material   => 'gemstone',
        },
        'jacinth stone' => {
            price      => 3250,
            hardness   => 'hard',
            appearance => 'orange gem',
            plural     => 'jacinth stones',
            material   => 'gemstone',
        },
        'sapphire' => {
            price      => 3000,
            hardness   => 'hard',
            appearance => 'blue gem',
            plural     => 'sapphires',
            material   => 'gemstone',
        },
        'black opal' => {
            price      => 2500,
            hardness   => 'hard',
            appearance => 'black gem',
            plural     => 'black opals',
            material   => 'gemstone',
        },
        'emerald' => {
            price      => 2500,
            hardness   => 'hard',
            appearance => 'green gem',
            plural     => 'emeralds',
            material   => 'gemstone',
        },
        'turquoise stone' => {
            price       => 2000,
            hardness    => 'soft',
            appearances => [qw/green blue/],
            plural      => 'turquoise stones',
            material   => 'gemstone',
        },
        'aquamarine stone' => {
            price       => 1500,
            hardness    => 'hard',
            appearances => [qw/green blue/],
            plural      => 'aquamarine stones',
            material   => 'gemstone',
        },
        'citrine stone' => {
            price      => 1500,
            hardness   => 'soft',
            appearance => 'yellow gem',
            plural     => 'citrine stones',
            material   => 'gemstone',
        },
        'amber stone' => {
            price      => 1000,
            hardness   => 'soft',
            appearance => 'yellowish brown gem',
            plural     => 'amber stones',
            material   => 'gemstone',
        },
        'topaz stone' => {
            price      => 900,
            hardness   => 'hard',
            appearance => 'yellowish brown gem',
            plural     => 'topaz stones',
            material   => 'gemstone',
        },
        'jet stone' => {
            price      => 850,
            hardness   => 'soft',
            appearance => 'black gem',
            plural     => 'jet stones',
            material   => 'gemstone',
        },
        'opal' => {
            price      => 800,
            hardness   => 'soft',
            appearance => 'white gem',
            plural     => 'opals',
            material   => 'gemstone',
        },
        'chrysoberyl stone' => {
            price      => 700,
            hardness   => 'soft',
            appearance => 'yellow gem',
            plural     => 'chrysoberyl stones',
            material   => 'gemstone',
        },
        'garnet stone' => {
            price      => 700,
            hardness   => 'soft',
            appearance => 'red gem',
            plural     => 'garnet stones',
            material   => 'gemstone',
        },
        'amethyst stone' => {
            price      => 600,
            hardness   => 'soft',
            appearance => 'violet gem',
            plural     => 'amethyst stones',
            material   => 'gemstone',
        },
        'jasper stone' => {
            price      => 500,
            hardness   => 'soft',
            appearance => 'red gem',
            plural     => 'jasper stones',
            material   => 'gemstone',
        },
        'fluorite stone' => {
            price       => 400,
            hardness    => 'soft',
            appearances => [qw/green blue white violet/],
            plural      => 'fluorite stones',
            material   => 'gemstone',
        },
        'jade stone' => {
            price      => 300,
            hardness   => 'soft',
            appearance => 'green gem',
            plural     => 'jade stones',
            material   => 'gemstone',
        },
        'agate stone' => {
            price      => 200,
            hardness   => 'soft',
            appearance => 'orange gem',
            plural     => 'agate stones',
            material   => 'gemstone',
        },
        'obsidian stone' => {
            price      => 200,
            hardness   => 'soft',
            appearance => 'black gem',
            plural     => 'obsidian stones',
            material   => 'gemstone',
        },
        'worthless piece of black glass' => {
            price      => 0,
            hardness   => 'soft',
            appearance => 'black gem',
            plural     => 'worthless pieces of black glass',
            material   => 'glass',
        },
        'worthless piece of blue glass' => {
            price      => 0,
            hardness   => 'soft',
            appearance => 'blue gem',
            plural     => 'worthless pieces of blue glass',
            material   => 'glass',
        },
        'worthless piece of green glass' => {
            price      => 0,
            hardness   => 'soft',
            appearance => 'green gem',
            plural     => 'worthless pieces of green glass',
            material   => 'glass',
        },
        'worthless piece of orange glass' => {
            price      => 0,
            hardness   => 'soft',
            appearance => 'orange gem',
            plural     => 'worthless pieces of orange glass',
            material   => 'glass',
        },
        'worthless piece of red glass' => {
            price      => 0,
            hardness   => 'soft',
            appearance => 'red gem',
            plural     => 'worthless pieces of red glass',
            material   => 'glass',
        },
        'worthless piece of violet glass' => {
            price      => 0,
            hardness   => 'soft',
            appearance => 'violet gem',
            plural     => 'worthless pieces of violet glass',
            material   => 'glass',
        },
        'worthless piece of white glass' => {
            price      => 0,
            hardness   => 'soft',
            appearance => 'white gem',
            plural     => 'worthless pieces of white glass',
            material   => 'glass',
        },
        'worthless piece of yellow glass' => {
            price      => 0,
            hardness   => 'soft',
            appearance => 'yellow gem',
            plural     => 'worthless pieces of yellow glass',
            material   => 'glass',
        },
        'worthless piece of yellowish brown glass' => {
            price      => 0,
            hardness   => 'soft',
            appearance => 'yellowish brown gem',
            plural     => 'worthless pieces of yellowish brown glass',
            material   => 'glass',
        },
        'luckstone' => {
            price      => 60,
            weight     => 10,
            hardness   => 'soft',
            appearance => 'gray stone',
            plural     => 'luckstones',
            material   => 'mineral',
        },
        'touchstone' => {
            price      => 45,
            weight     => 10,
            hardness   => 'soft',
            appearance => 'gray stone',
            plural     => 'touchstones',
            material   => 'mineral',
        },
        'flint stone' => {
            price      => 1,
            weight     => 10,
            hardness   => 'soft',
            appearance => 'gray stone',
            plural     => 'flint stones',
            material   => 'mineral',
        },
        'loadstone' => {
            price      => 1,
            weight     => 500,
            hardness   => 'soft',
            appearance => 'gray stone',
            plural     => 'loadstones',
            material   => 'mineral',
        },
        'rock' => {
            price      => 0,
            weight     => 10,
            hardness   => 'soft',
            appearance => 'rock',
            plural     => 'rocks',
            material   => 'mineral',
        },
    };

    return $gems, (weight => 1, stackable => 1);
}

sub extra_plurals {
    my %gems;

    $gems{"$_ gem"} = "$_ gems"
        for qw/white red blue orange black green yellow violet/;

    $gems{"yellowish brown gem"} = "yellowish brown gems";
    $gems{"gray stone"} = "gray stones";

    return \%gems;
}

1;

