#!/usr/bin/env perl
package NetHack::Item::Potion;
use Moose;
extends 'NetHack::Item';
with 'NetHack::Item::Role::Lightable';

use constant type => "potion";

has is_diluted => (
    traits  => [qw/IncorporatesUndef/],
    is      => 'rw',
    isa     => 'Bool',
    default => 0,
);

after incorporate_stats => sub {
    my $self  = shift;
    my $stats = shift;

    $self->is_diluted($stats->{diluted});
};

after incorporate_stats_from => sub {
    my $self  = shift;
    my $other = shift;

    $self->incorporate_stat($other => 'is_diluted');
};

__PACKAGE__->meta->make_immutable;
no Moose;

1;

