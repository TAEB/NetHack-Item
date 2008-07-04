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

no Moose::Role;

1;

