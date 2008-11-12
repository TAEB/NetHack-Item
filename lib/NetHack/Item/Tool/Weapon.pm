#!/usr/bin/env perl
package NetHack::Item::Tool::Weapon;
use Moose;
extends 'NetHack::Item::Tool';

use constant subtype => 'weapon';

__PACKAGE__->meta->make_immutable;
no Moose;

1;

