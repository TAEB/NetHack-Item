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

with 'NetHack::Item::Role::IncorporatesStats' => {
    attribute => 'is_partly_eaten',
    stat      => 'eaten',
};

with 'NetHack::Item::Role::IncorporatesStats' => {
    attribute => 'is_laid_by_you',
    stat      => 'laid',
};

__PACKAGE__->meta->install_spoilers(qw/nutrition time vegan vegetarian/);

__PACKAGE__->meta->make_immutable;
no Moose;

1;

