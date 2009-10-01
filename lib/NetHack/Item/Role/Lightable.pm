package NetHack::Item::Role::Lightable;
use Moose::Role;

has is_lit => (
    traits    => ['Bool'],
    is        => 'rw',
    isa       => 'Bool',
    default   => 0,
    handles   => {
        light      => 'set',
        extinguish => 'unset',
    },
);

with 'NetHack::Item::Role::IncorporatesStats' => {
    attribute => 'is_lit',
    stat      => 'lit',
    bool_stat => 1,
};

no Moose::Role;

1;

