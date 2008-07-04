#!/usr/bin/env perl
use strict;
use warnings;
use Test::More;
use NetHack::Item;
use List::Util 'sum';

my %base = (
    slot            => undef,
    quantity        => 1,
    buc             => undef,
    greased         => 0,
    poisoned        => 0,
    erosion1        => 0,
    erosion2        => 0,
    proof           => undef,
    used            => 0,
    eaten           => 0,
    diluted         => 0,
    item            => undef,
    enchantment     => undef,
    generic         => undef,
    specific        => undef,
    recharges       => undef,
    charges         => undef,
    candles         => 0,
    lit             => 0,
    laid            => 0,
    chained         => 0,
    quivered        => 0,
    offhand         => 0,
    wielded         => 0,
    offhand_wielded => 0,
    worn            => 0,
    price           => 0,
);

my %all_checks = (
    "a long sword" => {
        item => "long sword",
    },
    "the blessed +1 Excalibur" => {
        item        => "Excalibur",
        enchantment => '+1',
        buc         => 'blessed',
    },
    "a - 2 cursed -3 darts" => {
        item        => "darts",
        slot        => 'a',
        buc         => 'cursed',
        enchantment => '-3',
        quantity    => 2,
    },
    "a diluted potion called foo named bar" => {
        item     => "potion",
        generic  => 'foo',
        specific => 'bar',
        diluted  => 1,
    },
    "a - a +0 katana (weapon in hand)" => {
        item        => "katana",
        slot        => 'a',
        enchantment => '+0',
        wielded     => 1,
    },
    "b - a +0 wakizashi (alternate weapon; not wielded)" => {
        item        => "wakizashi",
        slot        => 'b',
        enchantment => '+0',
        offhand     => 1,
    },
    "b - a +0 wakizashi (wielded in other hand)" => {
        item            => "wakizashi",
        slot            => 'b',
        enchantment     => '+0',
        offhand_wielded => 1,
    },
    "p - a partly used candle (lit)" => {
        item => 'candle',
        lit  => 1,
        slot => 'p',
        used => 1,
    },
    "p - a partly used candle" => {
        item => 'candle',
        slot => 'p',
        used => 1,
    },
    "o - a candelabrum (no candles attached)" => {
        item    => 'candelabrum',
        slot    => 'o',
    },
    "o - a candelabrum (1 candle attached)" => {
        item    => 'candelabrum',
        slot    => 'o',
        candles => 1,
    },
    "o - a candelabrum (1 candle, lit)" => {
        item    => 'candelabrum',
        lit     => 1,
        slot    => 'o',
        candles => 1,
    },
    "q - a poisoned dart (in quiver)" => {
        item     => 'dart',
        slot     => 'q',
        poisoned => 1,
        quivered => 1,
    },
    "r - a potion of holy water" => {
        slot => 'r',
        item => 'potion of water',
        buc  => 'holy',
    },
    "r - a potion of unholy water" => {
        slot => 'r',
        item => 'potion of water',
        buc  => 'unholy',
    },
    "r - an uncursed potion of water" => {
        slot => 'r',
        item => 'potion of water',
        buc  => 'uncursed',
    },
    "u - a partly eaten food ration" => {
        slot  => 'u',
        item  => 'food ration',
        eaten => 1,
    },
    "p - a scroll labeled TEMOV" => {
        slot => 'p',
        item => 'scroll labeled TEMOV',
    },
    "p - a blessed scroll of charging" => {
        slot => 'p',
        item => 'scroll of charging',
        buc  => 'blessed',
    },
    "q - a fizzy potion" => {
        slot => 'q',
        item => 'fizzy potion',
    },
    "q - an uncursed potion of oil" => {
        slot => 'q',
        item => 'potion of oil',
        buc  => 'uncursed',
    },
    "o - a wand of wishing (0:3)" => {
        slot      => 'o',
        item      => 'wand of wishing',
        charges   => 3,
        recharges => 0,
    },
    "o - a wand of wishing (0:0)" => {
        slot      => 'o',
        item      => 'wand of wishing',
        recharges => 0,
        charges   => 0,
    },
    "o - a wand of wishing (1:3)" => {
        slot      => 'o',
        item      => 'wand of wishing',
        charges   => 3,
        recharges => 1,
    },
    "t - a wand of wishing (0:-1)" => {
        slot      => 't',
        item      => 'wand of wishing',
        charges   => -1,
        recharges => 0,
    },
    "o - a wand of wishing (1:-1)" => {
        slot      => 'o',
        item      => 'wand of wishing',
        charges   => -1,
        recharges => 1,
    },
    "v - a bag of tricks (0:14)" => {
        slot      => 'v',
        item      => 'bag of tricks',
        charges   => 14,
        recharges => 0,
    },
    "x - a heavy iron ball (chained to you)" => {
        slot    => 'x',
        item    => 'heavy iron ball',
        chained => 1,
    },
    "o - a cockatrice egg (laid by you)" => {
        slot => 'o',
        item => 'cockatrice egg',
        laid => 1,
    },
    "b - an uncursed burnt +0 cloak of magic resistance (being worn)" => {
        slot        => 'b',
        item        => 'cloak of magic resistance',
        enchantment => '+0',
        worn        => 1,
        erosion1    => 1,
        buc         => 'uncursed',
    },
    "e - an uncursed ring of conflict" => {
        slot => 'e',
        buc  => 'uncursed',
        item => 'ring of conflict',
    },
    "e - an uncursed ring of conflict (on left hand)" => {
        slot => 'e',
        buc  => 'uncursed',
        item => 'ring of conflict',
        worn => 'left',
    },
    "e - an uncursed ring of conflict (on right hand)" => {
        slot => 'e',
        buc  => 'uncursed',
        item => 'ring of conflict',
        worn => 'right',
    },
    "h - 100 gold pieces" => {
        slot     => 'h',
        item     => 'gold pieces',
        quantity => 100,
    },
);

plan tests => scalar keys %all_checks;

for my $item (sort keys %all_checks) {
    my $checks = { %base, %{ $all_checks{$item} } };

    my $stats = NetHack::Item->extract_stats($item);
    is_deeply($stats, $checks, "'$item'");
}

