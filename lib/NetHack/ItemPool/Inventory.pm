#!/usr/bin/env perl
package NetHack::ItemPool::Inventory;
use Moose;
use MooseX::AttributeHelpers;

use NetHack::ItemPool::Equipment;

has inventory => (
    metaclass => 'Collection::Hash',
    is        => 'ro',
    isa       => 'HashRef[NetHack::Item]',
    default   => sub { {} },
    provides  => {
        get    => 'get',
        set    => 'set',
        delete => 'remove',
        values => 'items',
        keys   => 'slots',
        empty  => 'has_items',
    },
);

has equipment => (
    is      => 'ro',
    isa     => 'NetHack::ItemPool::Equipment',
    lazy    => 1,
    default => sub { NetHack::ItemPool::Equipment->new },
    handles => qr/^(?!update|remove)\w/,
);

sub _extract_slot {
    my ($slot, $item);

    if (@_ == 2) {
        ($slot, $item) = @_;
        $item->slot($slot);
    }
    else {
        $item = shift;
        $slot = $item->slot;
        confess "No slot was passed to set, and the item ($item) didn't have a value for its slot attribute." if !defined($slot);
    }

    return $slot => $item;
}

around set => sub {
    my $orig = shift;
    my $self = shift;

    my ($slot, $item) = _extract_slot(@_);

    $self->$orig($slot => $item);
};

sub update {
    my $self = shift;
    my ($slot, $item) = _extract_slot(@_);

    if (my $old = $self->get($slot)) {
        if ($item->is_evolution_of($old)) {
            $old->incorporate_stats_from($item);
        }
        else {
            $self->set($slot => $item);
        }

        return $old;
    }

    $self->set($slot => $item);
    return $item;
}

after update => sub {
    my $self = shift;
    my (undef, $item) = _extract_slot(@_);

    $self->equipment->update($item);
};

before remove => sub {
    my $self = shift;
    my $item = $self->get(shift);

    $self->equipment->remove($item);
};

__PACKAGE__->meta->make_immutable;
no Moose;

1;

__END__

=head1 NAME

NetHack::ItemPool::Inventory - the player's inventory

=head1 SYNOPSIS

    use NetHack::ItemPool;
    my $pool = NetHack::ItemPool->new;

    $pool->new_item("x - 3 food rations");
    $pool->inventory->get('x'); # NetHack::Item<3 food rations>

    $pool->new_item("M - a unicorn horn");

    # updates (not replaces!) the horn already in M
    $pool->new_item("M - a blessed unicorn horn");

    # replaces the horn in M because it's a different item
    $pool->new_item("M - a scroll of taming");

=head1 DESCRIPTION

=cut

