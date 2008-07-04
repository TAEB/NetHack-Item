#!/usr/bin/env perl
package NetHack::Item::Spoiler;
use strict;
use warnings;

use Module::Pluggable search_path => __PACKAGE__, require => 1;

use Memoize;
memoize 'possibilities_to_appearances';
memoize 'plurals';
memoize 'plural_of_list';
memoize 'singular_of_list';

sub possibilities_to_appearances {
    my $self = shift;
    my $list = $self->list;

    my %possibilities;

    for my $stats (values %$list) {
            push @{ $possibilities{$_} }, $stats->{name}
                for grep { defined }
                         $stats->{appearance},
                         @{ $stats->{appearances} };
    }

    return \%possibilities;
}

sub possibilities_for_appearance {
    my $self = shift;
    my $appearance = shift;
    my $possibilities;

    $possibilities = [$appearance] if $self->list->{$appearance};
    $possibilities ||= $self->possibilities_to_appearances->{$appearance};
    $possibilities ||= [];

    return $possibilities;
}

sub plurals {
    my $self = shift;
    my $list = $self->list;
    my %plurals;

    for (values %$list) {
        $plurals{$_->{name}} = $_->{plural}
            if $_->{plural};
    }

    if ($self->can('extra_plurals')) {
        my $extra = $self->extra_plurals;
        @plurals{keys %$extra} = values %$extra;
    }

    return \%plurals;
}

sub plural_of_list {
    my $self = shift;
    my %all_plurals;

    for my $class ($self->plugins) {
        my $plurals = $class->plurals;
        @all_plurals{keys %$plurals} = values %$plurals;
    }

    return \%all_plurals;
}

sub singular_of_list {
    my $self = shift;
    return { reverse %{ $self->plural_of_list } };
}

sub pluralize {
    my $self = shift;
    my $item = shift;

    $self->plural_of_list->{$item};
}

sub singularize {
    my $self = shift;
    my $item = shift;

    $self->singular_of_list->{$item};
}

1;

