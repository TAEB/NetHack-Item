#!/usr/bin/env perl
package NetHack::Item::Amulet;
use Moose;
extends 'NetHack::Item';
with 'NetHack::Item::Role::Wearable';

__PACKAGE__->meta->make_immutable;
no Moose;

1;

