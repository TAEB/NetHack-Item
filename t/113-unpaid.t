#!/usr/bin/env perl
use lib 't/lib';
use Test::NetHack::Items (
    "a - a blessed +1 quarterstaff (weapon in hands) (unpaid, 15 zorkmids)",
    {cost => 15},
    "p - a +0 studded leather armor (being worn) (unpaid, 15 zorkmids)",
    {cost => 15},
    "x - 11 arrows (in quiver) (unpaid, 22 zorkmids)",
    {cost => 22},
    "B - a tin (unpaid, 5 zorkmids)",
    {cost => 5},
    "o - an uncursed triangular amulet (being worn) (unpaid, 150 zorkmids)",
    {cost => 150},
    "d - an uncursed brass ring (on right hand) (unpaid, 100 zorkmids)",
    {cost => 100},
    "c - a runed wand (unpaid, 200 zorkmids)",
    {cost => 200},
    "I - a lamp (lit) (unpaid, 10 zorkmids)",
    {cost => 10},
    "z - a yellow gem (unpaid, 1500 zorkmids)",
    {cost => 1500},
    "H - a partly used candle",
    {cost => 0},
);

