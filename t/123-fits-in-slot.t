#!/usr/bin/env perl
use strict;
use warnings;

sub fits_ok {
    my ($yes, $slot, $str) = @_;

    my $fits = NetHack::Item->new($str)->fits_in_slot($slot);

    ok(($fits ? 1 : 0) == ($yes ? 1 : 0),
        $str . ($yes ? " fits in " : " does not fit in ") . $slot);
}

my @list = (
    [1, cloak      => 'cloak of magic resistance'],
    [1, offhand    => 'cloak of magic resistance'],
    [0, helmet     => 'cloak of magic resistance'],
    [1, cloak      => 'ornamental cope'],
    [1, weapon     => 'Cleaver'],
    [0, shield     => 'Cleaver'],
    [1, left_ring  => 'ring of regeneration'],
    [1, right_ring => 'sapphire ring'],
    [0, amulet     => 'sapphire ring'],
    [1, blindfold  => 'towel'],
    [0, blindfold  => 'katana'],
);

require Test::More; Test::More->import(tests => scalar @list);
require NetHack::Item;

for (@list) { fits_ok @$_; }
