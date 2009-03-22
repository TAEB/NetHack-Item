package NetHack::Item::Spoiler::Other;
use strict;
use warnings;
use base 'NetHack::Item::Spoiler';
use NetHack::Monster::Spoiler;

use constant type => 'other';

sub _list {
    my $others = {
        'gold piece' => {
            price  => 1,
            weight => 0.01,
            glyph  => '$',
            plural => 'gold pieces',
            stackable  => 1,
            material => 'gold',
        },
        'boulder' => {
            price     => 0,
            weight    => 6000,
            glyph     => '0',
            sdam      => 'd20',
            ldam      => 'd20',
            nutrition => 2000,
            plural    => 'boulders',
            material  => 'mineral',
        },
        'heavy iron ball' => {
            price     => 10,
            weight    => 480,
            glyph     => '0',
            sdam      => 'd25',
            ldam      => 'd25',
            nutrition => 480,
            plural    => 'heavy iron balls',
            material  => 'iron',
        },
        'iron chain' => {
            price     => 0,
            weight    => 120,
            glyph     => '_',
            sdam      => 'd4+1',
            ldam      => 'd4+1',
            nutrition => 120,
            plural    => 'iron chains',
            material  => 'iron',
        },
        'acid venom' => {
            price  => 0,
            weight => 1,
            glyph  => '.',
            sdam   => '2d6',
            ldam   => '2d6',
            plural => 'acid venoms',
            stackable  => 1,
            material   => 'liquid',
        },
        'blinding venom' => {
            price  => 0,
            weight => 1,
            glyph  => '.',
            plural => 'blinding venoms',
            stackable  => 1,
            material   => 'liquid',
        },
    };

    for my $monster (NetHack::Monster::Spoiler->list) {
        my $name = "statue of ";
        $name .= "the " if $monster->is_unique && !$monster->has_proper_name;
        $name .= $monster->name =~ /^[aeiou]/i ? "an " : "a "
            if !$monster->is_unique;
        $name .= $monster->name;

        $others->{$name} = {
            price     => 0,
            weight    => 900,
            glyph     => '`',
            sdam      => 'd20',
            ldam      => 'd20',
            nutrition => 2500,
            material  => 'mineral',
            monster   => $monster,
        },
    }

    return $others;
}

1;

