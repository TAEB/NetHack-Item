#!/usr/bin/env perl
package NetHack::Item::Ring;
use Moose;
extends 'NetHack::Item';
with 'NetHack::Item::Role::Wearable';
with 'NetHack::Item::Role::Enchantable';

use Moose::Util::TypeConstraints qw/subtype as where/;

use constant type => "ring";

subtype 'NetHack::Item::Hand'
     => as 'Item'
     => where { !defined($_) || $_ eq 'left' || $_ eq 'right' };

has hand => (
    traits => [qw/IncorporatesUndef/],
    is     => 'rw',
    isa    => 'NetHack::Item::Hand',
);

after incorporate_stats => sub {
    my $self  = shift;
    my $stats = shift;

    if (($stats->{worn} || '') =~ /(left|right)/) {
        $self->hand($1);
    }
};

after incorporate_stats_from => sub {
    my $self  = shift;
    my $other = shift;

    $self->incorporate_stat($other => 'hand');
};

__PACKAGE__->meta->make_immutable;
no Moose;
no Moose::Util::TypeConstraints;

1;

