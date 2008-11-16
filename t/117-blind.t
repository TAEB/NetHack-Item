#!/usr/bin/env perl
use lib 't/lib';
use Test::NetHack::Item tests => 1;

TODO: {
    local $TODO = "no plan yet for blind items";
    test_items(
        "a potion" => {
            appearance => undef,
        },
    );
}

