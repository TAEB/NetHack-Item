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
        push   => 'add_item',
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

sub remove_item {
    my $self = shift;
    my $item = shift;

    my $contents = $self->contents;

    for (my $i = 0; $i < @$contents; ) {
        if ($contents->[$i] == $item) {
            splice @$contents, $i, 1;
            $item->clear_container;
            last;
        }
        else {
            ++$i;
        }
    }

    return $item;
}

sub remove_quantity {
    my $self          = shift;
    my $item          = shift;
    my $quantity      = shift;
    my $item_quantity = $item->quantity;

    return $self->remove_item($item)
        if $item_quantity == $quantity;

    $item->fork_quantity($quantity);
}

__PACKAGE__->meta->make_immutable;
no Moose;

1;

