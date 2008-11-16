#!/usr/bin/env perl
use lib 't/lib';
use Test::NetHack::Item tests => 4;

evolution_not_ok "a +1 long sword" => "an uncursed carrot";
evolution_not_ok "a dagger" => "a short sword";

