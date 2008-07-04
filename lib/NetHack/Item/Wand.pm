#!/usr/bin/env perl
package NetHack::Item::Wand;
use Moose;
extends 'NetHack::Item';
with 'NetHack::Item::Role::Chargeable';
with 'NetHack::Item::Role::Damageable';

use constant type => "wand";

__PACKAGE__->meta->make_immutable;
no Moose;

1;

