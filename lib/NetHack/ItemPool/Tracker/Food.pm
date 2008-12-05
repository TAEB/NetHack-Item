package NetHack::ItemPool::Tracker::Food;
use Moose;
extends 'NetHack::ItemPool::Tracker';

use constant type => 'food';


__PACKAGE__->meta->make_immutable;
no Moose;

1;

