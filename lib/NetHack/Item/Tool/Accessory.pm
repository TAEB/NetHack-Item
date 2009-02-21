package NetHack::Item::Tool::Accessory;
use Moose;
extends 'NetHack::Item::Tool';
with 'NetHack::Item::Role::Wearable';

use constant subtype => 'accessory';
use constant specific_slots => ['blindfold'];

__PACKAGE__->meta->make_immutable;
no Moose;

1;

