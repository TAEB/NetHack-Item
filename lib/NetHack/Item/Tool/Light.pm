#!/usr/bin/env perl
package NetHack::Item::Tool::Light;
use Moose;
extends 'NetHack::Item::Tool';
with 'NetHack::Item::Role::Lightable';

use constant subtype => 'light';

has is_partly_used => (
    is      => 'rw',
    isa     => 'Bool',
    default => 0,
);

after incorporate_stats => sub {
    my $self  = shift;
    my $stats = shift;

    $self->is_partly_used($stats->{used});
};

after incorporate_stats_from => sub {
    my $self  = shift;
    my $other = shift;

    $self->incorporate_stat($other => 'is_partly_used');
};

__PACKAGE__->meta->make_immutable;
no Moose;

1;

