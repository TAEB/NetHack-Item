#!/usr/bin/env perl
package NetHack::Item::Food;
use Moose;
extends 'NetHack::Item';

use constant type => "food";

has is_partly_eaten => (
    is      => 'rw',
    isa     => 'Bool',
    default => 0,
);

has is_laid_by_you => (
    is      => 'rw',
    isa     => 'Bool',
    default => 0,
);

after incorporate_stats => sub {
    my $self  = shift;
    my $stats = shift;

    $self->is_partly_eaten($stats->{eaten});
    $self->is_laid_by_you($stats->{laid});
};

__PACKAGE__->meta->make_immutable;
no Moose;

1;

