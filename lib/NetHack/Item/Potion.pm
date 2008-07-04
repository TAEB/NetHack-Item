#!/usr/bin/env perl
package NetHack::Item::Potion;
use Moose;
extends 'NetHack::Item';
with 'NetHack::Item::Role::Lightable';

use constant type => "potion";

__PACKAGE__->meta->make_immutable;
no Moose;

1;

