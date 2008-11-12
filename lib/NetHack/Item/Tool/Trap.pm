#!/usr/bin/env perl
package NetHack::Item::Tool::Trap;
use Moose;
extends 'NetHack::Item::Tool';

use constant subtype => 'trap';

__PACKAGE__->meta->make_immutable;
no Moose;

1;

