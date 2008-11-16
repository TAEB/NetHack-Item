#!/usr/bin/env perl
package NetHack::Item::Role::Lightable;
use Moose::Role;
use MooseX::AttributeHelpers;

has is_lit => (
    metaclass => 'Bool',
    is        => 'rw',
    isa       => 'Bool',
    default   => 0,
    provides  => {
        set   => 'light',
        unset => 'extinguish',
    },
);

after incorporate_stats => sub {
    my $self  = shift;
    my $stats = shift;

    $self->is_lit($stats->{lit} ? 1 : 0);
};

after incorporate_stats_from => sub {
    my $self  = shift;
    my $other = shift;

    $self->incorporate_stat($other => 'is_lit');
};

no Moose::Role;

1;

