#!/usr/bin/env perl
package NetHack::ItemPool::Equipment;
use Moose;

my @weapon_slots = (qw/weapon offhand quiver/);
my @armor_slots = (qw/helmet gloves boots bodyarmor cloak shirt shield/);
my @accessory_slots = (qw/left_ring right_ring amulet/);
my @eq_slots = (@weapon_slots, @armor_slots, @accessory_slots);

for my $slot (@eq_slots) {
    has $slot => (
        is        => 'rw',
        isa       => 'NetHack::Item',
        clearer   => "clear_$slot",
        predicate => "has_$slot",
    );
}

my %weapon_slots = (
    weapon  => 'is_wielded',
    offhand => 'is_offhand',
    quiver  => 'is_quivered',
);

sub update {
    my $self = shift;
    my $item = shift;

    $self->_update_weapon($item);
    $self->_update_ring($item);
    $self->_update_armor($item);
}

sub _update_ring {
    my $self = shift;
    my $item = shift;

    if ($item->type eq 'ring' && (my $hand = $item->hand)) {
        my $slot = "${hand}_ring";
        my $clearer = "clear_$slot";
        $self->$clearer;
        $self->$slot($item);
    }
}

sub _update_weapon {
    my $self = shift;
    my $item = shift;

    for my $slot (keys %weapon_slots) {
        my $check = $weapon_slots{$slot};

        if ($item->$check) {
            my $clearer = "clear_$slot";
            $self->$clearer;
            $self->$slot($item);
        }
    }
}

sub _update_armor {
    my $self = shift;
    my $item = shift;

    return unless $item->does('NetHack::Item::Role::Wearable');

    if ($item->is_worn) {
        my %types = (
            amulet    => ['amulet'],
            helmet    => ['armor', 'helmet'],
            gloves    => ['armor', 'gloves'],
            boots     => ['armor', 'boots'],
            bodyarmor => ['armor', 'bodyarmor'],
            cloak     => ['armor', 'cloak'],
            shirt     => ['armor', 'shirt'],
            shield    => ['armor', 'shield'],
        );

        for my $slot (keys %types) {
            my ($type, $subtype) = @{ $types{$slot} };
            next if $item->type ne $type;
            next if $subtype && $item->subtype ne $subtype;

            my $clearer = "clear_$slot";
            $self->$clearer;

            $self->$slot($item);

            last;
        }
    }
}

sub remove {
    my $self = shift;
    my $item = shift;

    for my $eq_slot (@eq_slots) {
        my $in_slot = $self->$eq_slot;

        next unless $in_slot
                 && $in_slot->slot eq $item->slot;

        my $clearer = "clear_$eq_slot";
        $self->$clearer;
    }
};

for my $slot (keys %weapon_slots) {
    my $accessor = $weapon_slots{$slot};

    before "clear_$slot" => sub {
        my $self = shift;
        my $item = $self->$slot or return;
        $item->$accessor(0);
    };
};

for my $slot (@armor_slots) {
    before "clear_$slot" => sub {
        my $self = shift;
        my $item = $self->$slot or return;
        $item->is_worn(0);
    };
}

for my $hand (qw/left_ring right_ring/) {
    before "clear_$hand" => sub {
        my $self = shift;
        my $item = $self->$hand or return;
        $item->hand(undef);
    };
}

__PACKAGE__->meta->make_immutable;
no Moose;

1;

__END__

=head1 NAME

NetHack::ItemPool::Equipment - the player's equipment

=head1 SYNOPSIS

    use NetHack::ItemPool;
    my $pool = NetHack::ItemPool->new;
    my $excalibur = $pool->new_item("the +3 Excalibur (weapon in hand)");
    is($pool->inventory->weapon, $excalibur);

    my $grayswandir = $pool->new_item("the +7 Grayswandir (weapon in hand)");
    is($pool->inventory->weapon, $grayswandir);

=head1 DESCRIPTION

=cut

