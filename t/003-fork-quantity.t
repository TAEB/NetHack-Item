#!/usr/bin/env perl
use lib 't/lib';
use Test::NetHack::Item tests => 9;

my $daggers = NetHack::Item->new("10 +1 daggers");
is($daggers->quantity, 10);

my $dagger = $daggers->fork_quantity(1);
is($dagger->quantity, 1);
is($daggers->quantity, 9);

is($dagger->enchantment, '+1');
is($daggers->enchantment, '+1');

$daggers->enchantment('+3');
is($dagger->enchantment, '+1');
is($daggers->enchantment, '+3');

throws_ok {
    $daggers->fork_quantity(9);
} qr/^Unable to fork the entire quantity \(9\) of item \(NetHack::Item::Weapon=HASH\(\w+\)\)/;

throws_ok {
    $daggers->fork_quantity(18);
} qr/^Unable to fork more \(18\) than the entire quantity \(9\) of item \(NetHack::Item::Weapon=HASH\(\w+\)\)/;

