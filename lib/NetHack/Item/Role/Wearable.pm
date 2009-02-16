#!/usr/bin/env perl
package NetHack::Item::Role::Wearable;
use Moose::Role;
use MooseX::AttributeHelpers;

has is_worn => (
    metaclass => 'Bool',
    is        => 'rw',
    isa       => 'Bool',
    default   => 0,
    provides  => {
        set   => 'wear',
        unset => 'remove',
    },
);

around is_worn => sub {
    my $orig = shift;
    my $self = shift;

    return $orig->($self) if !@_; # reader

    my $is_worn = shift;
    my $before = $self->is_worn;

    my $ret = $orig->($self, $is_worn, @_);

    if ($self->has_pool && $is_worn ^ $before) {
        my $slot;

        if ($self->type eq 'armor') {
            $slot = $self->subtype;
        }
        elsif ($self->type eq 'ring') {
            my $hand = $self->hand;

            die "When changing a ring's worn status, you must have the 'hand' attribute set" if !$hand;
            $slot = "${hand}_ring";
        }
        else {
            $slot = $self->type;
        }

        my $equipment = $self->pool->inventory->equipment;
        if ($is_worn) {
            my $existing = $equipment->$slot;
            $existing->is_worn(0) if $existing && $existing != $self;

            $equipment->$slot($self);
        }
        else {
            my $clearer = "clear_$slot";
            $equipment->$clearer;
        }
    }

    return $ret;
};

after incorporate_stats => sub {
    my $self  = shift;
    my $stats = shift;

    $self->is_worn($stats->{worn} ? 1 : 0);
};

after incorporate_stats_from => sub {
    my $self  = shift;
    my $other = shift;

    $self->incorporate_stat($other => 'is_worn');
};

no Moose::Role;

1;

