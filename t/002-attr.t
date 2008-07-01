#!/usr/bin/env perl
use strict;
use warnings;
use Test::More tests => 1;
use NetHack::Item;

can_ok 'NetHack::Item' => qw(raw);

