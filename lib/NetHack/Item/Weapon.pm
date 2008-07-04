#!/usr/bin/env perl
package NetHack::Item::Weapon;
use Moose;
extends 'NetHack::Item';
with 'NetHack::Item::Role::Enchantable';
with 'NetHack::Item::Role::Damageable';

use constant type => "weapon";

around can_drop => sub {
    my $orig = shift;
    my $self = shift;

    return 0 if $self->is_wielded && $self->is_cursed;
    $self->$orig(@_);
};

__PACKAGE__->meta->make_immutable;
no Moose;

1;

