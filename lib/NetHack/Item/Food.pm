package NetHack::Item::Food;
use Moose;
extends 'NetHack::Item';

use constant subtypes => "corpse";
use constant type => "food";

has is_partly_eaten => (
    traits  => [qw/IncorporatesUndef/],
    is      => 'rw',
    isa     => 'Bool',
);

has is_laid_by_you => (
    is      => 'rw',
    isa     => 'Bool',
    default => 0,
);

after incorporate_stats => sub {
    my $self  = shift;
    my $stats = shift;

    $self->is_partly_eaten($stats->{eaten});
    $self->is_laid_by_you($stats->{laid});
};

after incorporate_stats_from => sub {
    my $self  = shift;
    my $other = shift;

    $self->incorporate_stat($other => 'is_partly_eaten');
};

__PACKAGE__->meta->install_spoilers(qw/nutrition time/);

__PACKAGE__->meta->make_immutable;
no Moose;

1;

