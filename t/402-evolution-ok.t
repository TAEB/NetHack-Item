#!/usr/bin/env perl
use lib 't/lib';
use Test::NetHack::Item tests => 8;

evolution_not_ok "a +1 long sword" => "an uncursed carrot";
evolution_not_ok "a dagger" => "a short sword";
evolution_not_ok "a scroll of mail" => "a scroll of genocide";
evolution_not_ok "a sky blue potion" => "a purple-red potion";

