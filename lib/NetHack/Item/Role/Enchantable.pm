#!/usr/bin/env perl
package NetHack::Item::Role::Enchantable;
use Moose::Role;

has enchantment => (
    is  => 'rw',
    isa => 'Str',
);

after incorporate_stats => sub {
    my $self  = shift;
    my $stats = shift;

    $self->enchantment($stats->{enchantment})
        if defined $stats->{enchantment};
};

no Moose::Role;

1;

