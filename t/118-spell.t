#!/usr/bin/env perl
use lib 't/lib';
use constant testing_method => 'spell';
use Test::NetHack::Items (
    'spellbook of force bolt'      => 'force bolt',
    'spellbook of finger of death' => 'finger of death',
    'spellbook of jumping'         => 'jumping',

    'spellbook of blank paper'     => undef,
    'Book of the Dead'             => undef,

    'papyrus spellbook'            => undef,
    'silver spellbook'             => undef,
    'dog eared spellbook'          => undef,
);

