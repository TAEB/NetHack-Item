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

for my $damage (qw/burnt corroded rotted rusty/) {
    with 'NetHack::Item::Role::IncorporatesStats' => {
        attribute => $damage,
    };
}

with 'NetHack::Item::Role::IncorporatesStats' => {
    attribute    => 'proofed',
    defined_stat => 1,
};

sub remove_damage {
    my $self = shift;
    $self->$_(0) for qw/burnt corroded rotted rusty/;
}

no Moose::Role;

1;

