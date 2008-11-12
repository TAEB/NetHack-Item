#!/usr/bin/env perl
package NetHack::Item::Armor::Bodyarmor;
use Moose;
extends 'NetHack::Item::Armor';

use constant subtype => 'bodyarmor';

__PACKAGE__->meta->make_immutable;
no Moose;

1;

