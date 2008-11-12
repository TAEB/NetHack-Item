#!/usr/bin/env perl
package NetHack::Item::Armor::Cloak;
use Moose;
extends 'NetHack::Item::Armor';

use constant subtype => 'cloak';

__PACKAGE__->meta->make_immutable;
no Moose;

1;

