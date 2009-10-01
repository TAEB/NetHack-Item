package NetHack::ItemPool::Tracker;
use Moose;
use Set::Object;
with 'NetHack::ItemPool::Role::HasPool';

use Module::Pluggable (
    search_path => __PACKAGE__,
    require     => 1,
    sub_name    => 'tracker_types',
);

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

has all_possibilities => (
    is       => 'ro',
    isa      => 'Set::Object',
    required => 1,
);

sub BUILD {
    my $self = shift;

    my $class = __PACKAGE__ . '::' . ucfirst($self->type);
    Class::MOP::load_class($class);
    $class->meta->rebless_instance($self);
}

around BUILDARGS => sub {
    my $orig = shift;
    my $args = $orig->(@_);

    $args->{all_possibilities} = Set::Object->new(@{ $args->{all_possibilities} });
    $args->{possibilities} = Set::Object->new(@{ $args->{all_possibilities} });

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

around rule_out => sub {
    my $orig = shift;
    my $self = shift;

    for my $possibility (@_) {
        next if $self->all_possibilities->includes($possibility);
        confess "$possibility is not included in " . $self->appearance . "'s set of all possibilities.";
    }

    $self->$orig(@_);

    for my $possibility (@_) {
        $self->trackers->ruled_out($self => $possibility);
    }

    if ($self->possibilities == 1) {
        $self->trackers->identified($self => $self->possibilities);
    }
    elsif ($self->possibilities == 0) {
        confess "Ruled out all possibilities for " . $self->appearance . "!";
    }
};

__PACKAGE__->meta->make_immutable;
no Moose;

# need to delay this until after this class is already immutable, or else the
# subclasses get broken constructors
__PACKAGE__->tracker_types; # load all

1;

