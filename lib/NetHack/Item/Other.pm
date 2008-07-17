#!/usr/bin/env perl
package NetHack::Item::Other;
use Moose;
extends 'NetHack::Item';

use constant type => "other";

has is_chained_to_you => (
    is      => 'rw',
    isa     => 'Bool',
    default => 0,
);

has statue => (
    is  => 'rw',
    isa => 'Str',
);

after incorporate_stats => sub {
    my $self  = shift;
    my $stats = shift;

    $self->is_chained_to_you($stats->{chained});
    $self->statue($stats->{statue}) if exists $stats->{statue};
};

__PACKAGE__->meta->make_immutable;
no Moose;

1;

