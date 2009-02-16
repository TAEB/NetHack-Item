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
    trigger   => sub {
        my ($self, $is_worn) = @_;
        return unless $self->has_pool;

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

        if ($is_worn) {
            $self->pool->inventory->equipment->$slot($self);
        }
        else {
            my $clearer = "clear_$slot";
            $self->pool->inventory->equipment->$clearer;
        }
    },
);

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

