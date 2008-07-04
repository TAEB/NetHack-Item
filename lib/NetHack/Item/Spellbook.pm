#!/usr/bin/env perl
package NetHack::Item::Spellbook;
use Moose;
extends 'NetHack::Item';

use constant type => "spellbook";

sub spell {
    my $self = shift;

    return;

    # XXX: this needs possibility tracking

    return unless $self->has_identity;
    return unless $self->identity =~ m{^spellbook of (.*)$};
    return $1;
}

__PACKAGE__->meta->make_immutable;
no Moose;

1;

