#!/usr/bin/env perl
package NetHack::Item::Tool;
use Moose;
extends 'NetHack::Item';
with 'NetHack::Item::Role::Chargeable';  # bags of tricks
with 'NetHack::Item::Role::Damageable';  # pick-axe
with 'NetHack::Item::Role::Enchantable'; # unicorn horn
with 'NetHack::Item::Role::Lightable';   # lamps
with 'NetHack::Item::Role::Wearable';    # towel
with 'NetHack::Item::Role::EnchantBUC';

use constant type => "tool";

has is_partly_used => (
    is      => 'rw',
    isa     => 'Bool',
    default => 0,
);

has candles_attached => (
    is      => 'rw',
    isa     => 'Int',
    default => 0,
);

after incorporate_stats => sub {
    my $self  = shift;
    my $stats = shift;

    $self->is_partly_used($stats->{used});
    $self->candles_attached($stats->{candles});
};

__PACKAGE__->meta->make_immutable;
no Moose;

1;

