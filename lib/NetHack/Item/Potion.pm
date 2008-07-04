#!/usr/bin/env perl
package NetHack::Item::Potion;
use Moose;
extends 'NetHack::Item';
with 'NetHack::Item::Role::Lightable';

use constant type => "potion";

has is_diluted => (
    is      => 'rw',
    isa     => 'Bool',
    default => 0,
);

after incorporate_stats => sub {
    my $self  = shift;
    my $stats = shift;

    $self->is_diluted($stats->{diluted});
};

__PACKAGE__->meta->make_immutable;
no Moose;

1;

