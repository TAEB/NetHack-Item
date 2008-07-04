#!/usr/bin/env perl
package NetHack::Item::Role::EnchantBUC;
use Moose::Role;

# if we know the enchantment and BUC isn't set, then set it to uncursed
after enchantment => sub {
    my $self = shift;
    return if !@_;

    $self->is_uncursed(1) if !$self->buc;
};

no Moose::Role;

1;

