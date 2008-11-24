#!/usr/bin/env perl
package NetHack::ItemPool::Trackers;
use Moose;

use NetHack::ItemPool::Tracker;
use NetHack::Item::Spoiler;

use constant tracker_class => 'NetHack::ItemPool::Tracker';
use constant spoiler_class => 'NetHack::Item::Spoiler';

has trackers => (
    is      => 'ro',
    isa     => 'HashRef[NetHack::ItemPool::Tracker]',
    lazy    => 1,
    builder => '_build_trackers',
);

sub _appearances_to_possibilities {
    my $self = shift;
    my $mapping = {};

    for my $spoiler ($self->spoiler_class->spoiler_types) {
        my $list = $spoiler->list;
        for my $identity (keys %$list) {
            my $entry = $list->{$identity};

            next if $entry->{artifact};

            my @appearances = grep { defined }
                              $entry->{appearance},
                              @{ $entry->{appearances} || [] };

            for my $appearance (@appearances) {
                push @{ $mapping->{$appearance} }, $identity;
            }
        }
    }

    # now delete the obvious ones, and sort the others
    for my $appearance (keys %$mapping) {
        if (@{ $mapping->{$appearance} } == 1) {
            delete $mapping->{$appearance};
        }
        else {
            @{ $mapping->{$appearance} } = sort @{ $mapping->{$appearance} };
        }
    }

    return $mapping;
}

sub _build_trackers {
    my $self = shift;
    my $trackers = {};

    return $trackers;
}

__PACKAGE__->meta->make_immutable;
no Moose;

1;

