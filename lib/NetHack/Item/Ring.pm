#!/usr/bin/env perl
package NetHack::Item::Ring;
use Moose;
extends 'NetHack::Item';

use Moose::Util::TypeConstraints 'enum';

use constant type => "ring";

has hand => (
    is => 'rw',
    isa => enum [qw/left right/],
);

__PACKAGE__->meta->make_immutable;
no Moose;
no Moose::Util::TypeConstraints;

1;

