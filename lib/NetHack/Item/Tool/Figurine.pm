#!/usr/bin/env perl
package NetHack::Item::Tool::Figurine;
use Moose;
extends 'NetHack::Item::Tool';

use constant subtype => 'figurine';

has figurine => (
    is  => 'rw',
    isa => 'Str',
);

after incorporate_stats => sub {
    my $self  = shift;
    my $stats = shift;
    $self->figurine($stats->{figurine}) if exists $stats->{figurine};
};

__PACKAGE__->meta->make_immutable;
no Moose;

1;

