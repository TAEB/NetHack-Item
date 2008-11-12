#!/usr/bin/env perl
package NetHack::Item::Tool::Container;
use Moose;
extends 'NetHack::Item::Tool';

use constant subtype => 'container';

__PACKAGE__->meta->make_immutable;
no Moose;

1;

