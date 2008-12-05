package NetHack::ItemPool::Tracker::Weapon;
use Moose;
extends 'NetHack::ItemPool::Tracker';

use constant type => 'weapon';


__PACKAGE__->meta->make_immutable;
no Moose;

1;

