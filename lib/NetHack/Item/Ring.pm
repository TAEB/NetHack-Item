#!/usr/bin/env perl
package NetHack::Item::Ring;
use Moose;
extends 'NetHack::Item';
with 'NetHack::Item::Role::Wearable';
with 'NetHack::Item::Role::Enchantable';

use Moose::Util::TypeConstraints 'enum';

use constant type => "ring";

has hand => (
    is => 'rw',
    isa => enum [qw/left right/],
);

after incorporate_stats => sub {
    my $self  = shift;
    my $stats = shift;

    if (($stats->{worn} || '') =~ /(left|right)/) {
        $self->hand($1);
    }
};

__PACKAGE__->meta->make_immutable;
no Moose;
no Moose::Util::TypeConstraints;

1;

