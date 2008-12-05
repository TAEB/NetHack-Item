#!/usr/bin/env perl
package NetHack::ItemPool::Tracker::Wand;
use TAEB::OO;
extends 'NetHack::ItemPool::Tracker';

my @_groups = (
    [ 'cold'          ],
    [ 'polymorph'     ],
    [ 'speed monster' ],
    [ 'slow monster'  ],
    [ 'striking'      ],
    [ 'magic missile' ],
    [ 'light'         ],
    [ 'enlightenment' ],
    [ 'create monster'],
    [ 'digging'       ],
    [ 'fire'          ],
    [ 'lightning'     ],
    [ 'wishing'       ],

    [ qw/sleep death/ ],
    [ 'teleportation', 'make invisible', 'cancellation' ],

    [ 'locking', 'nothing', 'opening', 'probing', 'undead turning', 'secret door detection' ],
);

my @groups = map { { map { +"wand of $_" => 1 } @$_ } } @_groups;

sub engrave_useful {
    my $self = shift;

    # How this works is we group each wand identity based on what it would
    # do in an engrave ID. For example, sleep and death would go into one
    # group, and invis, tele, canc would go into another. If we have
    # possible identities from two or more groups, then engrave-IDing would
    # be useful in the sense that it'd rule some possibilities out.

    my $appearance_groups = 0;
    GROUP: for my $group (@groups) {
        for my $possibility ($self->possibilities) {
            next unless $group->{$possibility};
            return 1 if $appearance_groups++ > 0;
            next GROUP;
        }
    }

    return 0;
}

sub no_engrave_message {
    my $self = shift;
    $self->rule_out_all_but(map { "wand of $_" } 'locking', 'nothing', 'opening', 'probing', 'undead turning', 'secret door detection');
}

__PACKAGE__->meta->make_immutable;
no Moose;

1;

