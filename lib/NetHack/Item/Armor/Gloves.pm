#!/usr/bin/env perl
package NetHack::Item::Armor::Gloves;
use Moose;
extends 'NetHack::Item::Armor';

use constant subtype => 'gloves';

__PACKAGE__->meta->make_immutable;
no Moose;

1;

