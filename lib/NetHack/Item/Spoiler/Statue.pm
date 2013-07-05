package NetHack::Item::Spoiler::Statue;
use strict;
use warnings;
use base 'NetHack::Item::Spoiler';
use NetHack::Monster::Spoiler;

use constant type => 'statue';

sub _list {
    my %statues;

    for my $monster (NetHack::Monster::Spoiler->list) {
        my $name = "statue of ";
        $name .= "the " if $monster->is_unique && !$monster->has_proper_name;
        $name .= $monster->name =~ /^[aeiou]/i ? "an " : "a "
            if !$monster->is_unique;
        $name .= $monster->name;

        $statues{$name} = {
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

    return \%statues;
}

1;


