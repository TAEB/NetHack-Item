#!/usr/bin/env perl
package NetHack::Item::Role::Wearable;
use Moose::Role;
use MooseX::AttributeHelpers;

has is_worn => (
    metaclass => 'Bool',
    is        => 'rw',
    isa       => 'Bool',
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

no Moose::Role;

1;

