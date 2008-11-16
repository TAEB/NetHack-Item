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

