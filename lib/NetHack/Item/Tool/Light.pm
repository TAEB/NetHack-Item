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

__PACKAGE__->meta->make_immutable;
no Moose;

1;

