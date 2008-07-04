#!/usr/bin/env perl
package NetHack::Item::Gem;
use Moose;
extends 'NetHack::Item';

use constant type => "gem";

has is_hard => (
    is  => 'rw',
    isa => 'Bool',
);

__PACKAGE__->meta->make_immutable;
no Moose;

1;

