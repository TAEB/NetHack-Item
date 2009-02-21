package NetHack::Item::Gem;
use Moose;
extends 'NetHack::Item';

use constant type => "gem";

__PACKAGE__->meta->install_spoilers('hardness');
sub softness { shift->hardness(@_) }

__PACKAGE__->meta->make_immutable;
no Moose;

1;

