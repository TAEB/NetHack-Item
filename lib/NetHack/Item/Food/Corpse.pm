#!/usr/bin/env perl
package NetHack::Item::Food::Corpse;
use Moose;
extends 'NetHack::Item::Food';

use constant subtype => 'corpse';

__PACKAGE__->meta->install_spoilers(qw/
    acidic aggravate cannibal cold_resistance die disintegration_resistance
    energy fire_resistance gain_level hallucination heal intelligence
    invisibility lycanthropy monster permanent petrify poison_resistance
    poisonous polymorph reanimates shock_resistance sleep_resistance slime
    speed_toggle strength stun telepathy teleport_control teleportitis
/);

__PACKAGE__->meta->make_immutable;
no Moose;

1;

