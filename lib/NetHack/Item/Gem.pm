#!/usr/bin/env perl
package NetHack::Item::Gem;
use Moose;
extends 'NetHack::Item';

use constant type => "gem";

__PACKAGE__->meta->make_immutable;
no Moose;

1;

