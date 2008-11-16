#!/usr/bin/env perl
package NetHack::Item::Tool::Container;
use Moose;
use MooseX::AttributeHelpers;
extends 'NetHack::Item::Tool';

use constant subtype => 'container';

has contents => (
    metaclass => 'Collection::Array',
    is        => 'rw',
    isa       => 'ArrayRef[NetHack::Item]',
    default   => sub { [] },
    provides  => {
        push => 'add_item',
    },
);

has contents_known => (
    is      => 'rw',
    isa     => 'Bool',
    default => 0,
);

around add_item => sub {
    my $orig = shift;
    my $self = shift;
    my $item = shift;

    return if $item->is_in_container && $item->container == $self;

    $self->$orig($item);

    $item->container($self);
};


__PACKAGE__->meta->make_immutable;
no Moose;

1;

