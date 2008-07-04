#!/usr/bin/env perl
package NetHack::Item::Role::Wearable;
use Moose::Role;

has worn => (
    is  => 'rw',
    isa => 'Bool',
);

after incorporate_stats => sub {
    my $self  = shift;
    my $stats = shift;

    $self->worn($stats->{worn} ? 1 : 0);
};

no Moose::Role;

1;

