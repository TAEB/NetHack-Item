#!/usr/bin/env perl
use strict;
use warnings;
use Test::More tests => 12;
use NetHack::Item::Spoiler;

my $spoiler = "NetHack::Item::Spoiler";
is($spoiler->pluralize("scroll of mail"), "scrolls of mail");
is($spoiler->singularize("scrolls of mail"), "scroll of mail");

my $scroll = "NetHack::Item::Spoiler::Scroll";
is_deeply($scroll->possibilities_for_appearance("scroll of mail"), ["scroll of mail"]);
is_deeply($scroll->possibilities_for_appearance("scrolls of mail"), [], "need to singularize");

is($spoiler->name_to_type("scroll of mail"), "scroll");
is($spoiler->name_to_type("stamped scroll"), "scroll");
is($spoiler->name_to_type("scroll of charging"), "scroll");
is($spoiler->name_to_type("scroll labeled KIRJE"), "scroll");
is($spoiler->name_to_type("scrolls of mail"), undef);

is($spoiler->name_to_type("cloak of magic resistance"), "armor");
is($spoiler->name_to_type("opera cloak"), "armor");
is($spoiler->name_to_type("opera cloaks"), undef);

