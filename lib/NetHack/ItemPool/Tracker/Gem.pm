package NetHack::ItemPool::Tracker::Gem;
use Moose;
extends 'NetHack::ItemPool::Tracker';

use constant type => 'gem';


__PACKAGE__->meta->make_immutable;
no Moose;

1;

