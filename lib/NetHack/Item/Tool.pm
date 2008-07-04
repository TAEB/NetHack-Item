#!/usr/bin/env perl
package NetHack::Item::Tool;
use Moose;
extends 'NetHack::Item';
with 'TAEB::World::Item::Role::Chargeable';  # bags of tricks
with 'TAEB::World::Item::Role::Enchantable'; # unicorn horn
with 'TAEB::World::Item::Role::Erodable';    # pick-axe
with 'TAEB::World::Item::Role::Lightable';   # lamps
with 'TAEB::World::Item::Role::Wearable';    # towel

use constant type => "tool";

__PACKAGE__->meta->make_immutable;
no Moose;

1;

