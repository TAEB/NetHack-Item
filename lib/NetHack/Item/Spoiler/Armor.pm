#!/usr/bin/env perl
package NetHack::Item::Spoiler::Armor;
use strict;
use warnings;
use base 'NetHack::Item::Spoiler';

use Memoize;
memoize 'list';

my @cloaks  = ('tattered cape', 'opera cloak', 'ornamental cope', 'piece of cloth');
my @helmets = map { "$_ helmet" } qw/plumed etched crested visored/;
my @gloves  = map { "$_ gloves" } qw/old padded riding fencing/;
my @boots   = map { "$_ boots"  } qw/combat jungle hiking mud buckled riding snow/;

sub list {
    my $armor = {
        'Mitre of Holiness' => {
            artifact   => 1,
            base       => 'helm of brilliance',
            value      => 2000,
            weight     => 50,
            ac         => 1,
            material   => 'iron',
        },

        'Hawaiian shirt' => {
            value      => 3,
            weight     => 5,
            ac         => 0,
            material   => 'cloth',
        },
        'T-shirt' => {
            value      => 2,
            weight     => 5,
            ac         => 0,
            material   => 'cloth',
        },

        'leather jacket' => {
            value      => 10,
            weight     => 30,
            ac         => 1,
            material   => 'leather',
        },
        'leather armor' => {
            value      => 5,
            weight     => 150,
            ac         => 2,
            material   => 'leather',
        },
        'orcish ring mail' => {
            value      => 80,
            weight     => 250,
            ac         => 2,
            material   => 'iron',
            mc         => 1,
            appearance => 'crude ring mail',
        },
        'studded leather armor' => {
            value      => 15,
            weight     => 200,
            ac         => 3,
            material   => 'leather',
            mc         => 1,
        },
        'ring mail' => {
            value      => 100,
            weight     => 250,
            ac         => 3,
            material   => 'iron',
        },
        'scale mail' => {
            value      => 45,
            weight     => 250,
            ac         => 4,
            material   => 'iron',
        },
        'orcish chain mail' => {
            value      => 75,
            weight     => 300,
            ac         => 4,
            material   => 'iron',
            mc         => 1,
            appearance => 'crude chain mail',
        },
        'chain mail' => {
            value      => 75,
            weight     => 300,
            ac         => 5,
            material   => 'iron',
            mc         => 1,
        },
        'elven mithril-coat' => {
            value      => 240,
            weight     => 150,
            ac         => 5,
            material   => 'mithril',
            mc         => 3,
        },
        'splint mail' => {
            value      => 80,
            weight     => 400,
            ac         => 6,
            material   => 'iron',
            mc         => 1,
        },
        'banded mail' => {
            value      => 90,
            weight     => 350,
            ac         => 6,
            material   => 'iron',
        },
        'dwarvish mithril-coat' => {
            value      => 240,
            weight     => 150,
            ac         => 6,
            material   => 'mithril',
            mc         => 3,
        },
        'bronze plate mail' => {
            value      => 400,
            weight     => 450,
            ac         => 6,
            material   => 'copper',
        },
        'plate mail' => {
            value      => 600,
            weight     => 450,
            ac         => 7,
            material   => 'iron',
            mc         => 2,
        },
        'crystal plate mail' => {
            value      => 820,
            weight     => 450,
            ac         => 7,
            material   => 'glass',
            mc         => 2,
        },
        'red dragon scales' => {
            value      => 500,
            weight     => 40,
            ac         => 3,
            material   => 'dragon hide',
        },
        'white dragon scales' => {
            value      => 500,
            weight     => 40,
            ac         => 3,
            material   => 'dragon hide',
        },
        'orange dragon scales' => {
            value      => 500,
            weight     => 40,
            ac         => 3,
            material   => 'dragon hide',
        },
        'blue dragon scales' => {
            value      => 500,
            weight     => 40,
            ac         => 3,
            material   => 'dragon hide',
        },
        'green dragon scales' => {
            value      => 500,
            weight     => 40,
            ac         => 3,
            material   => 'dragon hide',
        },
        'yellow dragon scales' => {
            value      => 500,
            weight     => 40,
            ac         => 3,
            material   => 'dragon hide',
        },
        'black dragon scales' => {
            value      => 700,
            weight     => 40,
            ac         => 3,
            material   => 'dragon hide',
        },
        'silver dragon scales' => {
            value      => 700,
            weight     => 40,
            ac         => 3,
            material   => 'dragon hide',
        },
        'gray dragon scales' => {
            value      => 700,
            weight     => 40,
            ac         => 3,
            material   => 'dragon hide',
        },
        'red dragon scale mail' => {
            value      => 900,
            weight     => 40,
            ac         => 9,
            material   => 'dragon hide',
        },
        'white dragon scale mail' => {
            value      => 900,
            weight     => 40,
            ac         => 9,
            material   => 'dragon hide',
        },
        'orange dragon scale mail' => {
            value      => 900,
            weight     => 40,
            ac         => 9,
            material   => 'dragon hide',
        },
        'blue dragon scale mail' => {
            value      => 900,
            weight     => 40,
            ac         => 9,
            material   => 'dragon hide',
        },
        'green dragon scale mail' => {
            value      => 900,
            weight     => 40,
            ac         => 9,
            material   => 'dragon hide',
        },
        'yellow dragon scale mail' => {
            value      => 900,
            weight     => 40,
            ac         => 9,
            material   => 'dragon hide',
        },
        'black dragon scale mail' => {
            value      => 1200,
            weight     => 40,
            ac         => 9,
            material   => 'dragon hide',
        },
        'silver dragon scale mail' => {
            value      => 1200,
            weight     => 40,
            ac         => 9,
            material   => 'dragon hide',
        },
        'gray dragon scale mail' => {
            value      => 1200,
            weight     => 40,
            ac         => 9,
            material   => 'dragon hide',
        },

        'mummy wrapping' => {
            value      => 2,
            weight     => 3,
            ac         => 0,
            material   => 'cloth',
            mc         => 1,
        },
        'orcish cloak' => {
            value      => 40,
            weight     => 10,
            ac         => 0,
            material   => 'cloth',
            mc         => 2,
            appearance => 'coarse mantelet',
        },
        'dwarvish cloak' => {
            value      => 50,
            weight     => 10,
            ac         => 0,
            material   => 'cloth',
            mc         => 2,
            appearance => 'hooded cloak',
        },
        'leather cloak' => {
            value      => 40,
            weight     => 15,
            ac         => 1,
            material   => 'leather',
            mc         => 1,
        },
        'oilskin cloak' => {
            value      => 50,
            weight     => 10,
            ac         => 1,
            material   => 'cloth',
            mc         => 3,
            appearance => 'slippery cloak',
        },
        'alchemy smock' => {
            value      => 50,
            weight     => 10,
            ac         => 1,
            material   => 'cloth',
            mc         => 1,
            appearance => 'apron',
        },
        'elven cloak' => {
            value      => 60,
            weight     => 10,
            ac         => 1,
            material   => 'cloth',
            mc         => 3,
            appearance => 'faded pall',
        },
        'robe' => {
            value      => 50,
            weight     => 15,
            ac         => 2,
            material   => 'cloth',
            mc         => 3,
        },
        'cloak of displacement' => {
            value       => 50,
            weight      => 10,
            ac          => 1,
            material    => 'cloth',
            mc          => 2,
            appearances => \@cloaks,
        },
        'cloak of invisibility' => {
            value       => 60,
            weight      => 10,
            ac          => 1,
            material    => 'cloth',
            mc          => 2,
            appearances => \@cloaks,
        },
        'cloak of magic resistance' => {
            value       => 60,
            weight      => 10,
            ac          => 1,
            material    => 'cloth',
            mc          => 3,
            appearances => \@cloaks,
        },
        'cloak of protection' => {
            value       => 50,
            weight      => 10,
            ac          => 3,
            material    => 'cloth',
            mc          => 3,
            appearances => \@cloaks,
        },

        'fedora' => {
            value      => 1,
            weight     => 3,
            ac         => 0,
            material   => 'cloth',
        },
        'dunce cap' => {
            value      => 1,
            weight     => 4,
            ac         => 0,
            material   => 'cloth',
            appearance => 'conical hat',
        },
        'cornuthaum' => {
            value      => 80,
            weight     => 4,
            ac         => 0,
            material   => 'cloth',
            mc         => 2,
            appearance => 'conical hat',
        },
        'dented pot' => {
            value      => 8,
            weight     => 10,
            ac         => 1,
            material   => 'iron',
        },
        'elven leather helm' => {
            value      => 8,
            weight     => 3,
            ac         => 1,
            material   => 'leather',
            appearance => 'leather hat',
        },
        'orcish helm' => {
            value      => 10,
            weight     => 30,
            ac         => 1,
            material   => 'iron',
            appearance => 'iron skull cap',
        },
        'dwarvish iron helm' => {
            value      => 20,
            weight     => 40,
            ac         => 2,
            material   => 'iron',
            appearance => 'hard hat',
        },
        'helmet' => {
            value       => 10,
            weight      => 30,
            ac          => 1,
            material    => 'iron',
            appearances => \@helmets,
        },
        'helm of brilliance' => {
            value       => 50,
            weight      => 50,
            ac          => 1,
            material    => 'iron',
            appearances => \@helmets,
        },
        'helm of opposite alignment' => {
            value       => 50,
            weight      => 50,
            ac          => 1,
            material    => 'iron',
            appearances => \@helmets,
        },
        'helm of telepathy' => {
            value       => 50,
            weight      => 50,
            ac          => 1,
            material    => 'iron',
            appearances => \@helmets,
        },

        'leather gloves' => {
            value       => 8,
            weight      => 10,
            ac          => 1,
            material    => 'leather',
            appearances => \@gloves,
        },
        'gauntlets of dexterity' => {
            value       => 50,
            weight      => 10,
            ac          => 1,
            material    => 'leather',
            appearances => \@gloves,
        },
        'gauntlets of fumbling' => {
            value       => 50,
            weight      => 10,
            ac          => 1,
            material    => 'leather',
            appearances => \@gloves,
        },
        'gauntlets of power' => {
            value       => 50,
            weight      => 30,
            ac          => 1,
            material    => 'iron',
            appearances => \@gloves,
        },

        'small shield' => {
            value      => 3,
            weight     => 30,
            ac         => 1,
            material   => 'wood',
        },
        'orcish shield' => {
            value      => 7,
            weight     => 50,
            ac         => 1,
            material   => 'iron',
            appearance => 'red-eyed shield',
        },
        'Uruk-hai shield' => {
            value      => 7,
            weight     => 50,
            ac         => 1,
            material   => 'iron',
            appearance => 'white-handed shield',
        },
        'elven shield' => {
            value      => 7,
            weight     => 40,
            ac         => 2,
            material   => 'wood',
            appearance => 'blue and green shield',
        },
        'dwarvish roundshield' => {
            value      => 10,
            weight     => 100,
            ac         => 2,
            material   => 'iron',
            appearance => 'large round shield',
        },
        'large shield' => {
            value      => 10,
            weight     => 100,
            ac         => 2,
            material   => 'iron',
        },
        'shield of reflection' => {
            value      => 50,
            weight     => 50,
            ac         => 2,
            material   => 'silver',
            appearance => 'polished silver shield',
        },

        'low boots' => {
            value      => 8,
            weight     => 10,
            ac         => 1,
            material   => 'leather',
            appearance => 'walking shoes',
        },
        'high boots' => {
            value      => 12,
            weight     => 20,
            ac         => 2,
            material   => 'leather',
            appearance => 'jackboots',
        },
        'iron shoes' => {
            value      => 16,
            weight     => 50,
            ac         => 2,
            material   => 'iron',
            appearance => 'hard shoes',
        },
        'elven boots' => {
            value       => 8,
            weight      => 15,
            ac          => 1,
            material    => 'leather',
            appearances => \@boots,
        },
        'kicking boots' => {
            value       => 8,
            weight      => 15,
            ac          => 1,
            material    => 'iron',
            appearances => \@boots,
        },
        'fumble boots' => {
            value       => 30,
            weight      => 20,
            ac          => 1,
            material    => 'leather',
            appearances => \@boots,
        },
        'levitation boots' => {
            value       => 30,
            weight      => 15,
            ac          => 1,
            material    => 'leather',
            appearances => \@boots,
        },
        'jumping boots' => {
            value       => 50,
            weight      => 20,
            ac          => 1,
            material    => 'leather',
            appearances => \@boots,
        },
        'speed boots' => {
            value       => 50,
            weight      => 20,
            ac          => 1,
            material    => 'leather',
            appearances => \@boots,
        },
        'water walking boots' => {
            value       => 50,
            weight      => 20,
            ac          => 1,
            material    => 'leather',
            appearances => \@boots,
        },
    };

    # tag each armor with its name and appearance
    for my $name (keys %$armor) {
        my $stats = $armor->{$name};
        $stats->{name}       = $name;
        $stats->{type}       = 'armor';
        $stats->{appearance} = $name
            unless $stats->{appearance} || $stats->{appearances};
    }

    return $armor;
}

1;

