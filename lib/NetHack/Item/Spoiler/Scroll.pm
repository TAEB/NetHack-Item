#!/usr/bin/env perl
package NetHack::Item::Spoiler::Scroll;
use strict;
use warnings;
use base 'NetHack::Item::Spoiler';

use Memoize;
memoize 'list';

my @scrolls = map { "scroll labeled $_" } (
    'ZELGO MER', 'JUYED AWK YACC', 'NR 9', 'XIXAXA XOXAXA XUXAXA',
    'PRATYAVAYAH', 'DAIYEN FOOELS', 'LEP GEX VEN ZEA', 'PRIRUTSENIE',
    'ELBIB YLOH', 'TEMOV', 'VERR YED HORRE', 'VENZAR BORGAVVE', 'THARR',
    'YUM YUM', 'KERNOD WEL', 'ELAM EBOW', 'DUAM XNAHT', 'KIRJE',
    'ANDOVA BEGARIN', 'VE FORBRYDERNE', 'HACKEM MUCHE', 'VELOX NEB',
    'READ ME', 'FOOBIE BLETCH', 'GARVEN DEH',
);

sub list {
    my $scrolls = {
        'scroll of mail' => {
            price      => 0,
            marker     => 2,
            appearance => 'stamped scroll',
        },
        'scroll of blank paper' => {
            price      => 60,
            marker     => 0,
            appearance => 'unlabeled scroll',
        },

        'scroll of identify' => {
            price  => 20,
            marker => 14,
        },

        'scroll of light' => {
            price  => 50,
            marker => 8,
        },

        'scroll of enchant weapon' => {
            price  => 60,
            marker => 16,
        },

        'scroll of enchant armor' => {
            price  => 80,
            marker => 16,
        },
        'scroll of remove curse' => {
            price  => 80,
            marker => 16,
        },

        'scroll of confuse monster' => {
            price  => 100,
            marker => 12,
        },
        'scroll of destroy armor' => {
            price  => 100,
            marker => 10,
        },
        'scroll of fire' => {
            price  => 100,
            marker => 8,
        },
        'scroll of food detection' => {
            price  => 100,
            marker => 8,
        },
        'scroll of gold detection' => {
            price  => 100,
            marker => 8,
        },
        'scroll of magic mapping' => {
            price  => 100,
            marker => 8,
        },
        'scroll of scare monster' => {
            price  => 100,
            marker => 20,
        },
        'scroll of teleportation' => {
            price  => 100,
            marker => 20,
        },

        'scroll of amnesia' => {
            price  => 200,
            marker => 8,
        },
        'scroll of create monster' => {
            price  => 200,
            marker => 10,
        },
        'scroll of earth' => {
            price  => 200,
            marker => 8,
        },
        'scroll of taming' => {
            price  => 200,
            marker => 20,
        },

        'scroll of charging' => {
            price  => 300,
            marker => 16,
        },
        'scroll of genocide' => {
            price  => 300,
            marker => 30,
        },
        'scroll of punishment' => {
            price  => 300,
            marker => 10,
        },
        'scroll of stinking cloud' => {
            price  => 300,
            marker => 20,
        },
    };

    # tag each scroll with its name, weight, appearances, etc
    for my $name (keys %$scrolls) {
        my $stats = $scrolls->{$name};
        $stats->{name}        = $name;
        $stats->{weight}      = 5;
        $stats->{type}        = 'scroll';
        ($stats->{plural}     = $name) =~ s/\bscroll\b/scrolls/;
        $stats->{appearances} = \@scrolls
            unless $stats->{appearance} || $stats->{appearances};
    }

    return $scrolls;
}

sub extra_plurals {
    my $self = shift;
    my %extra;

    for (@scrolls, 'stamped scroll', 'unlabeled scroll') {
        (my $plural = $_) =~ s/\bscroll\b/scrolls/;
        $extra{$_} = $plural;
    }

    return \%extra;
}

1;

