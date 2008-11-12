#!/usr/bin/env perl
package NetHack::Item::Tool::Weapon;
use Moose;
extends 'NetHack::Item::Tool';
with 'NetHack::Item::Role::Enchantable';
with 'NetHack::Item::Role::EnchantBUC';

use constant subtype => 'weapon';

__PACKAGE__->meta->make_immutable;
no Moose;

1;

