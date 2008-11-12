#!/usr/bin/env perl
package NetHack::Item::Role::Chargeable;
use Moose::Role;
use MooseX::AttributeHelpers;

has recharges => (
    metaclass => 'Counter',
    is        => 'rw',
    isa       => 'Int',
    predicate => 'recharges_known',
    clearer   => '_clear_recharges',
    provides  => {
        inc => 'inc_recharges',
    },
);

has charges => (
    metaclass => 'Number',
    is        => 'rw',
    isa       => 'Int',
    predicate => 'charges_known',
    clearer   => 'set_charges_unknown',
    provides  => {
        'sub' => 'subtract_charges',
    },
);

has charges_spent_this_recharge => (
    metaclass => 'Number',
    is        => 'rw',
    isa       => 'Int',
    default   => 0,
    provides  => {
        add   => 'add_charges_spent_this_recharge',
    },
    curries => {
        set => {
            reset_charges_spent_this_recharge => [ 0 ],
        },
    },
);

has times_recharged => (
    metaclass => 'Counter',
    is        => 'rw',
    isa       => 'Int',
    default   => 0,
    provides  => {
        inc => 'inc_times_recharged',
    },
);

sub spend_charge {
    my $self = shift;
    my $count = shift || 1;

    $self->add_charges_spent_this_recharge($count);

    return unless $self->charges_known;
    $self->subtract_charges($count);
    if ($self->charges < 0) {
        $self->charges(0);
    }
}

sub recharge {
    my $self = shift;

    $self->set_charges_unknown;
    $self->inc_times_recharged;
    $self->reset_charges_spent_this_recharge;
    $self->inc_recharges if $self->has_recharges;
}

sub chance_to_recharge {
    my $self = shift;

    return undef if !$self->has_recharges;

    my $n = $self->recharges;

    # can always recharge at 0 recharges
    return 100 if $n == 0;

    # can recharge /oW only once
    return 0 if $self->match(identity => 'wand of wishing');

    # (n/7)^3
    return 100 - int(100 * (($n/7) ** 3));
}

after incorporate_stats => sub {
    my $self  = shift;
    my $stats = shift;

    $self->charges($stats->{charges}) if defined($stats->{charges});

    # apparently Counter sets the default to 0 for you. orz.
    $self->_clear_recharges;
    $self->recharges($stats->{recharges}) if defined($stats->{recharges});
};

no Moose::Role;

1;

