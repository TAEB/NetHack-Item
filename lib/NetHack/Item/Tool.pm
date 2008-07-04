#!/usr/bin/env perl
package NetHack::Item::Tool;
use Moose;
extends 'NetHack::Item';
with 'NetHack::Item::Role::Wearable'; # lenses, towel

use constant type => "tool";

__PACKAGE__->meta->make_immutable;
no Moose;

1;

