package NetHack::Item::Armor::Helmet;
use Moose;
extends 'NetHack::Item::Armor';

use constant subtype => 'helmet';

__PACKAGE__->meta->make_immutable;
no Moose;

1;

