#!/usr/bin/env perl
package NetHack::Item::Weapon;
use Moose;
extends 'NetHack::Item';

__PACKAGE__->meta->make_immutable;
no Moose;

1;

