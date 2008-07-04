#!/usr/bin/env perl
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

no Moose::Role;

1;

