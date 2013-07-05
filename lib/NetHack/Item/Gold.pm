package NetHack::Item::Gold;
use Moose;
extends 'NetHack::Item';

use constant type => "gold";

__PACKAGE__->meta->make_immutable;
no Moose;

1;

