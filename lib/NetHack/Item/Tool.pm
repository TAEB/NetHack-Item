#!/usr/bin/env perl
package NetHack::Item::Tool;
use Moose;
extends 'NetHack::Item';
with 'NetHack::Item::Role::Wearable'; # lenses, towel
with 'NetHack::Item::Role::Lightable'; # lamp, candles

use constant type => "tool";

__PACKAGE__->meta->make_immutable;
no Moose;

1;

