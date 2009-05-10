package NetHack::Item::Role::Lightable;
use Moose::Role;
use MooseX::AttributeHelpers;

has is_lit => (
    metaclass => 'Bool',
    is        => 'rw',
    isa       => 'Bool',
    default   => 0,
    provides  => {
        set   => 'light',
        unset => 'extinguish',
    },
);

with 'NetHack::Item::Role::IncorporatesStats' => {
    attribute => 'is_lit',
    stat      => 'lit',
    bool_stat => 1,
};

no Moose::Role;

1;

