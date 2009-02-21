package NetHack::Item::Tool;
use Moose;
extends 'NetHack::Item';
with 'NetHack::Item::Role::ChargeBUC';   # bags of tricks
with 'NetHack::Item::Role::Damageable';  # pick-axe

use constant type => "tool";

__PACKAGE__->meta->install_spoilers('charge');

__PACKAGE__->meta->make_immutable;
no Moose;

1;

