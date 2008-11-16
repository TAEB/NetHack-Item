#!/usr/bin/env perl
package NetHack::Item::Weapon;
use Moose;
extends 'NetHack::Item';
with 'NetHack::Item::Role::Enchantable';
with 'NetHack::Item::Role::Damageable';
with 'NetHack::Item::Role::EnchantBUC';

use constant type => "weapon";

has is_poisoned => (
    traits => [qw/IncorporatesUndef/],
    is     => 'rw',
    isa    => 'Bool',
);

after incorporate_stats => sub {
    my $self  = shift;
    my $stats = shift;

    $self->is_poisoned($stats->{poisoned});
};

after incorporate_stats_from => sub {
    my $self  = shift;
    my $other = shift;

    $self->incorporate_stat($other => 'is_poisoned');
};

around can_drop => sub {
    my $orig = shift;
    my $self = shift;

    return 0 if $self->is_wielded && $self->is_cursed;
    $self->$orig(@_);
};

__PACKAGE__->meta->make_immutable;
no Moose;

1;

