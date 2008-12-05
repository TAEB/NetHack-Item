package NetHack::ItemPool::Tracker::Spellbook;
use Moose;
extends 'NetHack::ItemPool::Tracker';

use constant type => 'spellbook';


__PACKAGE__->meta->make_immutable;
no Moose;

1;

