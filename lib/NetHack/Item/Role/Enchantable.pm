#!/usr/bin/env perl
package NetHack::Item::Role::Enchantable;
use Moose::Role;

has enchantment => (
    is        => 'rw',
    isa       => 'Str',
    predicate => 'enchantment_known',
);

after incorporate_stats => sub {
    my $self  = shift;
    my $stats = shift;

    $self->enchantment($stats->{enchantment})
        if defined $stats->{enchantment};
};

after incorporate_stats_from => sub {
    my $self  = shift;
    my $other = shift;

    $self->incorporate_stat($other => 'enchantment');
};

no Moose::Role;

1;

