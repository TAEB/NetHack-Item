#!/usr/bin/env perl
package NetHack::ItemPool::Tracker;
use Moose;

has type => (
    is       => 'ro',
    isa      => 'Str',
    required => 1,
);

has subtype => (
    is        => 'ro',
    isa       => 'Str',
    predicate => 'has_subtype',
);

has appearance => (
    is       => 'ro',
    isa      => 'Str',
    required => 1,
);

has possibilities => (
    is       => 'ro',
    isa      => 'ArrayRef[Str]',
    required => 1,
);

__PACKAGE__->meta->make_immutable;
no Moose;

1;

