#!/usr/bin/env perl
package NetHack::ItemPool::Tracker;
use Moose;
use Set::Object;
with 'NetHack::ItemPool::Role::HasPool';

has type => (
    is       => 'ro',
    isa      => 'Str',
    required => 1,
);

has subtype => (
    is        => 'ro',
    isa       => 'Str',
    predicate => 'has_subtype',
);

has appearance => (
    is       => 'ro',
    isa      => 'Str',
    required => 1,
);

has '+pool' => (
    required => 1,
    handles  => [qw/trackers/],
);

has _possibilities => (
    is       => 'ro',
    isa      => 'Set::Object',
    init_arg => 'possibilities',
    required => 1,
    handles => {
        rule_out             => 'remove',
        includes_possibility => 'includes',
    },
);

sub BUILD {
    my $self = shift;

    my $class = __PACKAGE__ . '::' . ucfirst($self->type);
    if (my $meta = Class::MOP::load_class($class)) {
        $meta->rebless_instance($self);
    }
}

around BUILDARGS => sub {
    my $orig = shift;
    my $args = $orig->(@_);

    $args->{possibilities} = Set::Object->new(@{ $args->{possibilities} })
        if exists $args->{possibilities};

    return $args;
};

sub possibilities {
    my @possibilities = shift->_possibilities->members;
    return @possibilities if !wantarray;
    return sort @possibilities;
}

sub identify_as {
    my $self     = shift;
    my $identity = shift;

    confess "$identity is not a possibility for " . $self->appearance
        unless $self->includes_possibility($identity);

    $self->rule_out(grep { $_ ne $identity } $self->possibilities);
}

sub rule_out_all_but {
    my $self = shift;
    my %include = map { $_ => 1 } @_;

    for ($self->possibilities) {
        $self->rule_out($_) unless $include{$_};
    }
}

after rule_out => sub {
    my $self = shift;
    for my $possibility (@_) {
        $self->trackers->ruled_out($self => $possibility);
    }

    if ($self->possibilities == 1) {
        $self->trackers->identified($self => $self->possibilities);
    }
};

__PACKAGE__->meta->make_immutable;
no Moose;

1;

