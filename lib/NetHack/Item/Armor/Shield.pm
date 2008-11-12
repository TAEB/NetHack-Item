#!/usr/bin/env perl
package NetHack::Item::Armor::Shield;
use Moose;
extends 'NetHack::Item::Armor';

use constant subtype => 'shield';

__PACKAGE__->meta->make_immutable;
no Moose;

1;

