#!/usr/bin/env perl
package NetHack::Item::Role::Damageable;
use Moose::Role;
use MooseX::AttributeHelpers;

has [qw/burnt corroded rotted rusty/]=> (
    is      => 'rw',
    isa     => 'Int',
    default => 0,
);

has proofed => (
    metaclass => 'Bool',
    traits    => [qw/IncorporatesUndef/],
    is        => 'rw',
    isa       => 'Bool',
    provides  => {
        set   => 'proof',
        unset => 'unproof',
    },
);

after incorporate_stats => sub {
    my $self  = shift;
    my $stats = shift;

    for (qw/burnt corroded rotted rusty/) {
        $self->$_($stats->{$_});
    }

    $self->proofed($stats->{proofed})
        if defined $stats->{proofed};
};

after incorporate_stats_from => sub {
    my $self  = shift;
    my $other = shift;

    $self->incorporate_stat($other => $_)
        for qw/burnt corroded rotted rusty proofed/;
};

no Moose::Role;

1;

