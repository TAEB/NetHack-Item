package NetHack::Item::Spellbook;
use Moose;
extends 'NetHack::Item';

use constant type => "spellbook";

sub spell {
    my $self = shift;

    return unless $self->has_identity;
    return unless $self->identity =~ m{^spellbook of (.*)$};
    return if $1 eq "blank paper";
    return $1;
}

__PACKAGE__->meta->install_spoilers(qw/ink level time emergency role/);

__PACKAGE__->meta->make_immutable;
no Moose;

1;

