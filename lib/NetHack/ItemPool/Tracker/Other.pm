package NetHack::ItemPool::Tracker::Other;
use Moose;
extends 'NetHack::ItemPool::Tracker';

use constant type => 'other';


__PACKAGE__->meta->make_immutable;
no Moose;

1;

