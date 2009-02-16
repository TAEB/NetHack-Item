#!/usr/bin/env perl
package NetHack::Item::Ring;
use Moose;
extends 'NetHack::Item';
with 'NetHack::Item::Role::Enchantable';

use Moose::Util::TypeConstraints qw/subtype as where/;

use constant type => "ring";

subtype 'NetHack::Item::Hand'
     => as 'Item'
     => where { !defined($_) || $_ eq 'left' || $_ eq 'right' };

has hand => (
    traits  => [qw/IncorporatesUndef/],
    is      => 'rw',
    isa     => 'NetHack::Item::Hand',
);

after incorporate_stats => sub {
    my $self  = shift;
    my $stats = shift;

    if (($stats->{worn} || '') =~ /(left|right)/) {
        $self->hand($1);
    }
};

after incorporate_stats_from => sub {
    my $self  = shift;
    my $other = shift;

    $self->incorporate_stat($other => 'hand');
};

around hand => sub {
    my $orig = shift;
    my $self = shift;

    return $orig->($self) if !@_; # reader

    my $hand = shift;
    my $before = $self->hand;

    # if we're *removing* the ring, then other code needs to know what hand we
    # WERE on, so set is_worn before clearing hand
    if (!$hand && $before) {
        $self->is_worn(0);
    }

    my $ret = $orig->($self, $hand, @_);

    # if we're donning the ring, then other code needs to know what hand we
    # just put it on, so set is_worn after setting hand
    if ($hand && !$before) {
        $self->is_worn(1);
    }

    return $ret;
};

# XXX: we need to incorporate "hand" before we incorporate "is_worn" :/
with 'NetHack::Item::Role::Wearable';

__PACKAGE__->meta->install_spoilers('chargeable');

__PACKAGE__->meta->make_immutable;
no Moose;
no Moose::Util::TypeConstraints;

1;

