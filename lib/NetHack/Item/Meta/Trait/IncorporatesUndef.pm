#!/usr/bin/env perl
package NetHack::Item::Meta::Trait::IncorporatesUndef;
use Moose::Role;

package Moose::Meta::Attribute::Custom::Trait::IncorporatesUndef;
sub register_implementation { 'NetHack::Item::Meta::Trait::IncorporatesUndef' }

1;

