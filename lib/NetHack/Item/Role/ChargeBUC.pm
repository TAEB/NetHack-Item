package NetHack::Item::Role::ChargeBUC;
use Moose::Role;

with 'NetHack::Item::Role::Chargeable';

# if we know the charges and BUC isn't set, then set it to uncursed
after charges => sub {
    my $self = shift;
    return if !@_;

    $self->is_uncursed(1) if !$self->buc;
};

no Moose::Role;

1;

