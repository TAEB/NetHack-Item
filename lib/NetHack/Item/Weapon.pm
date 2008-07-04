#!/usr/bin/env perl
package NetHack::Item::Weapon;
use Moose;
extends 'NetHack::Item';
with 'NetHack::Item::Role::Enchantable';
with 'NetHack::Item::Role::Damageable';

use constant type => "weapon";

has is_poisoned => (
    is  => 'rw',
    isa => 'Bool',
);

after incorporate_stats => sub {
    my $self  = shift;
    my $stats = shift;

    $self->is_poisoned($stats->{poisoned});
};

around can_drop => sub {
    my $orig = shift;
    my $self = shift;

    return 0 if $self->is_wielded && $self->is_cursed;
    $self->$orig(@_);
};

# if we know the enchantment and BUC isn't set, then set it to uncursed
after enchantment => sub {
    my $self = shift;
    return if !@_;

    $self->is_uncursed(1) if !$self->buc;
};

__PACKAGE__->meta->make_immutable;
no Moose;

1;

