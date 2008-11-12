#!/usr/bin/env perl
package NetHack::Item::Spoiler::Tool;
use strict;
use warnings;
use base 'NetHack::Item::Spoiler';

use constant type => 'tool';

sub _list {
    my $tools = {
        'Bell of Opening' => {
            artifact => 1,
            price => 5000,
            weight => 10,
            charge => 3,
            fullname => 'The Bell of Opening',
            appearance => 'silver bell',
            subtype => 'instrument',
        },
        'Candelabrum of Invocation' => {
            artifact => 1,
            price => 5000,
            weight => 10,
            charge => '',
            fullname => 'The Candelabrum of Invocation',
            appearance => 'candelabrum',
            subtype => 'candelabrum',
        },

        'Eyes of the Overworld' => {
            artifact => 1,
            base => 'lenses',
            price => 80,
            weight => 3,
            charge => '',
            fullname => 'The Eyes of the Overworld',
            subtype => 'accessory',
        },
        'Magic Mirror of Merlin' => {
            artifact => 1,
            base => 'mirror',
            price => 10,
            weight => 13,
            charge => '',
            fullname => 'The Magic Mirror of Merlin',
        },
        'Master Key of Thievery' => {
            artifact => 1,
            base => 'skeleton key',
            price => 10,
            weight => 3,
            charge => '',
            fullname => 'The Master Key of Thievery',
            subtype => 'key',
        },
        'Orb of Detection' => {
            artifact => 1,
            base => 'crystal ball',
            price => 60,
            weight => 150,
            charge => 5,
            fullname => 'The Orb of Detection',
        },
        'Orb of Fate' => {
            artifact => 1,
            base => 'crystal ball',
            price => 60,
            weight => 150,
            charge => 5,
            fullname => 'The Orb of Fate',
        },
        'Platinum Yendorian Express Card' => {
            artifact => 1,
            base => 'credit card',
            price => 10,
            weight => 1,
            charge => '',
            fullname => 'The Platinum Yendorian Express Card',
            subtype => 'key',
        },

        'large box' => {
            price => 8,
            weight => 350,
            charge => '',
            subtype => 'container',
        },
        'chest' => {
            price => 16,
            weight => 600, charge => '',
            subtype => 'container',
        },
        'ice box' => {
            price => 42,
            weight => 900,
            charge => '',
            subtype => 'container',
        },
        'sack' => {
            price => 2,
            weight => 15,
            charge => '',
            appearance => 'bag',
            subtype => 'container',
        },
        'bag of holding' => {
            price => 100,
            weight => 15,
            charge => '',
            appearance => 'bag',
            subtype => 'container',
        },
        'bag of tricks' => {
            price => 100,
            weight => 15,
            charge => 20,
            appearance => 'bag',
            #subtype => 'container', # NOT A CONTAINER!!
        },
        'oilskin sack' => {
            price => 100,
            weight => 15,
            charge => '',
            appearance => 'bag',
            subtype => 'container',
        },

        'credit card' => {
            price => 10,
            weight => 1,
            charge => '',
            subtype => 'key',
        },
        'lock pick' => {
            price => 20,
            weight => 4,
            charge => '',
            subtype => 'key',
        },
        'skeleton key' => {
            price => 10,
            weight => 3,
            charge => '',
            appearance => 'key',
            subtype => 'key',
        },

        'tallow candle' => {
            price => 10,
            weight => 2,
            charge => '',
            appearance => 'candle',
            plural => 'tallow candles',
            subtype => 'light',
        },
        'wax candle' => {
            price => 20,
            weight => 2,
            charge => '',
            appearance => 'candle',
            plural => 'wax candles',
            subtype => 'light',
        },
        'brass lantern' => {
            price => 12,
            weight => 30,
            charge => 1499,
            subtype => 'light',
        },
        'oil lamp' => {
            price => 10,
            weight => 20,
            charge => 1499,
            appearance => 'lamp',
            subtype => 'light',
        },
        'magic lamp' => {
            price => 50,
            weight => 20,
            charge => '',
            appearance => 'lamp',
            subtype => 'light',
        },

        'tin whistle' => {
            price => 10,
            weight => 3,
            charge => '',
            appearance => 'whistle',
            subtype => 'instrument',
            tonal => 0,
        },
        'magic whistle' => {
            price => 10,
            weight => 3,
            charge => '',
            appearance => 'whistle',
            subtype => 'instrument',
            tonal => 0,
        },
        'bugle' => {
            price => 15,
            weight => 10,
            charge => '',
            subtype => 'instrument',
            tonal => 1,
        },
        'wooden flute' => {
            price => 12,
            weight => 5,
            charge => '',
            appearance => 'flute',
            subtype => 'instrument',
            tonal => 1,
        },
        'magic flute' => {
            price => 36,
            weight => 5,
            charge => 8,
            appearance => 'flute',
            subtype => 'instrument',
            tonal => 1,
        },
        'tooled horn' => {
            price => 15,
            weight => 18,
            charge => '',
            appearance => 'horn',
            subtype => 'instrument',
            tonal => 1,
        },
        'frost horn' => {
            price => 50,
            weight => 18,
            charge => 8,
            appearance => 'horn',
            subtype => 'instrument',
            tonal => 1,
        },
        'fire horn' => {
            price => 50,
            weight => 18,
            charge => 8,
            appearance => 'horn',
            subtype => 'instrument',
            tonal => 1,
        },
        'horn of plenty' => {
            price => 50,
            weight => 18,
            charge => 20,
            appearance => 'horn',
            subtype => 'instrument',
            tonal => 0,
        },
        'leather drum' => {
            price => 25,
            weight => 25,
            charge => '',
            appearance => 'drum',
            subtype => 'instrument',
            tonal => 0,
        },
        'drum of earthquake' => {
            price => 25,
            weight => 25,
            charge => 8,
            appearance => 'drum',
            subtype => 'instrument',
            tonal => 0,
        },
        'wooden harp' => {
            price => 50,
            weight => 30,
            charge => '',
            appearance => 'harp',
            subtype => 'instrument',
            tonal => 1,
        },
        'magic harp' => {
            price => 50,
            weight => 30,
            charge => 8,
            appearance => 'harp',
            subtype => 'instrument',
            tonal => 1,
        },
        'bell' => {
            price => 50,
            weight => 30,
            charge => '',
            subtype => 'instrument',
            tonal => 0,
        },

        'beartrap' => {
            price => 60,
            weight => 200,
            charge => '',
            subtype => 'trap',
        },
        'land mine' => {
            price => 180,
            weight => 300,
            charge => '',
            appearance => 'land mine',
            subtype => 'trap',
        },

        'pick-axe' => {
            price => 50,
            weight => 100,
            charge => '',
            subtype => 'weapon',
        },
        'grappling hook' => {
            price => 50,
            weight => 30,
            charge => '',
            appearance => 'iron hook',
            subtype => 'weapon',
        },
        'unicorn horn' => {
            price => 100,
            weight => 20,
            charge => '',
            weaptool => 1,
            subtype => 'weapon',
        },

        'expensive camera' => {
            price => 200,
            weight => 12,
            charge => 99,
        },
        'mirror' => {
            price => 10,
            weight => 13,
            charge => '',
            appearance => 'looking glass',
        },
        'crystal ball' => {
            price => 60,
            weight => 150,
            charge => 5,
            appearance => 'glass orb',
        },
        'lenses' => {
            price => 80,
            weight => 3,
            charge => '',
            subtype => 'accessory',
        },
        'blindfold' => {
            price => 20,
            weight => 2,
            charge => '',
            subtype => 'accessory',
        },
        'towel' => {
            price => 50,
            weight => 2,
            charge => '',
            subtype => 'accessory',
        },
        'saddle' => {
            price => 150,
            weight => 200,
            charge => '',
        },
        'leash' => {
            price => 20,
            weight => 12,
            charge => '',
        },
        'stethoscope' => {
            price => 75,
            weight => 4,
            charge => '',
        },
        'tinning kit' => {
            price => 30,
            weight => 100,
            charge => 99,
        },
        'tin opener' => {
            price => 30,
            weight => 4,
            charge => '',
        },
        'can of grease' => {
            price => 20,
            weight => 15,
            charge => 25,
        },
        'figurine' => {
            price => 80,
            weight => 50,
            charge => '',
            subtype => 'figurine',
        },
        'magic marker' => {
            price => 50,
            weight => 2,
            charge => 99,
        },
    };

    return $tools;
}

sub extra_plurals {
    return {
        candle => 'candles',
    };
}

1;


