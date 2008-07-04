#!/usr/bin/env perl
package NetHack::Item;
use Moose;

our $VERSION = '0.01';

has raw => (
    is       => 'ro',
    isa      => 'Str',
    required => 1,
);

has slot => (
    is        => 'rw',
    isa       => 'Str',
    predicate => 'has_slot',
);

has quantity => (
    is      => 'rw',
    isa     => 'Int',
    default => 1,
);

has wielded => (
    is      => 'rw',
    isa     => 'Bool',
    default => 0,
);

for my $buc (qw/is_blessed is_uncursed is_cursed/) {
    my %others = map { $_ => 1 } qw/is_blessed is_uncursed is_cursed/;
    delete $others{$buc};

    has $buc => (
        is      => 'rw',
        isa     => 'Bool',
        trigger => sub {
            my $self = shift;
            my $set  = shift;

            # if this is true, the others must be false
            if ($set) {
                $self->$_(0) for keys %others;
            }
            # if this is false, then see if only one can be true
            elsif (defined($set)) {
                my %other_vals = map { $_ => $self->$_ } keys %others;

                my $unknown = 0;

                for (values %other_vals) {
                    return if $_; # we already have a true value
                    ++$unknown if !defined;
                }

                # multiple items are unknown, we can't narrow it down
                return if $unknown > 1;

                # only one item is unknown, find it and set it to true
                my ($must_be_true) = grep { !defined($other_vals{$_}) }
                                     keys %other_vals;
                $self->$must_be_true(1);
            }
        },
    );
}

for ([holy => 'blessed'], [unholy => 'cursed']) {
    my ($holiness, $buc) = @$_;
    __PACKAGE__->meta->alias_method("is_$holiness" => __PACKAGE__->meta->find_method_by_name("is_$buc"));
}

sub BUILDARGS {
    my $class = shift;

    if (@_ == 1) {
        return $_[0] if ref($_[0]) eq 'HASH';
        return { raw => $_[0] } if !ref($_[0]);
    }
    else {
        return { @_ };
    }

    confess "I don't know how to handle $class->new(@_)";
}

around BUILDARGS => sub {
    my $orig = shift;
    my $class = shift;
    my $args = $class->$orig(@_);

    if ($args->{buc}) {
        $args->{"is_$args->{buc}"} = 1;
    }

    $args->{is_blessed} = delete $args->{is_holy}
        if exists $args->{is_holy};
    $args->{is_cursed} = delete $args->{is_unholy}
        if exists $args->{is_unholy};

    return $args;
};

sub BUILD {
    my $self = shift;
    my $args = shift;

    $self->_rebless_into($args->{type}) if $args->{type};

    $self->parse_raw;
}

sub _rebless_into {
    my $self = shift;
    my $type = shift;

    return if !blessed($self);

    my $class = "NetHack::Item::" . ucfirst lc $type;
    my $meta = Class::MOP::load_class($class);
    $meta->rebless_instance($self);
}

sub extract_stats {
    my $self = shift;
    my $raw  = shift || $self->raw;

    my %stats;

    my @fields = qw/slot quantity buc greased poisoned erosion1 erosion2 proof
                    used eaten diluted enchantment item generic specific
                    recharges charges candles lit_candelabrum lit laid chained
                    quivered offhand offhand_wielded wielded worn price/;

    # this regex was written by Jesse Luehrs
    @stats{@fields} = $raw =~ m{
        ^                                                      # anchor
        (?:([\w\#\$])\s[+-]\s)?                           \s*  # slot
        ([Aa]n?|[Tt]he|\d+)?                              \s*  # quantity
        (blessed|(?:un)?cursed|(?:un)?holy)?              \s*  # buc
        (greased)?                                        \s*  # grease
        (poisoned)?                                       \s*  # poison
        ((?:(?:very|thoroughly)\ )?(?:burnt|rusty))?      \s*  # erosion 1
        ((?:(?:very|thoroughly)\ )?(?:rotted|corroded))?  \s*  # erosion 2
        (fixed|(?:fire|rust|corrode)proof)?               \s*  # proof
        (partly\ used)?                                   \s*  # candles
        (partly\ eaten)?                                  \s*  # food
        (diluted)?                                        \s*  # potions
        ([+-]\d+)?                                        \s*  # enchantment
        (?:(?:pair|set)\ of)?                             \s*  # gloves boots
        (.*?)                                             \s*  # item name
        (?:called\ (.*?))?                                \s*  # generic name
        (?:named\ (.*?))?                                 \s*  # specific name
        (?:\((\d+):(-?\d+)\))?                            \s*  # charges
        (?:\((no|[1-7])\ candles?(,\ lit|\ attached)\))?  \s*  # candelabrum
        (\(lit\))?                                        \s*  # lit
        (\(laid\ by\ you\))?                              \s*  # eggs
        (\(chained\ to\ you\))?                           \s*  # iron balls
        (\(in\ quiver\))?                                 \s*  # quivered
        (\(alternate\ weapon;\ not\ wielded\))?           \s*  # offhand
        (\(wielded\ in\ other.*?\))?                      \s*  # offhand wield
        (\(weapon.*?\))?                                  \s*  # wielding
        (\((?:being|embedded|on).*?\))?                   \s*  # worn
        (?:\(unpaid,\ (\d+)\ zorkmids?\))?                \s*  # shops
        $                                                      # anchor
    }x;

    if ($stats{item} =~ /^potion of ((?:un)?holy) water$/) {
        $stats{item} = 'potion of water';
        $stats{buc}  = $1;
    }

    $stats{quantity} = 1 if !defined($stats{quantity})
                         || $stats{quantity} =~ /\D/;

    $stats{lit_candelabrum} = ($stats{lit_candelabrum}||'') =~ /lit/;
    $stats{lit} = delete($stats{lit_candelabrum}) || $stats{lit};
    $stats{candles} = 0 if ($stats{candles}||'') eq 'no';

    $stats{worn} = !defined($stats{worn})               ? 0
                 : $stats{worn} =~ /\(on (left|right) / ? $1
                                                        : 1;

    # boolean stats
    for (qw/greased poisoned erosion1 erosion2 used eaten diluted lit laid chained quivered offhand offhand_wielded wielded/) {
        $stats{$_} = defined($stats{$_}) ? 1 : 0;
    }

    # maybe-boolean stats
    for (qw/proof/) {
        $stats{$_} = defined($stats{$_}) ? 1 : undef;
    }

    # numeric, undef = 0 stats
    for (qw/candles price/) {
        $stats{$_} = 0 if !defined($stats{$_});
    }

    return \%stats;
}

sub parse_raw {
    my $self = shift;
    my $raw  = shift || $self->raw;

    my $stats = $self->extract_stats($raw);

    $self->incorporate_stats($stats);
}

sub incorporate_stats {
    my $self  = shift;
    my $stats = shift;

    $self->slot($stats->{slot}) if defined $stats->{slot};
    $self->quantity($stats->{quantity});
    $self->wielded($stats->{wielded});

    if ($stats->{buc}) {
        my $is_buc = "is_$stats->{buc}";
        $self->$is_buc(1);
    }
}

__PACKAGE__->meta->make_immutable;
no Moose;

1;

__END__

=head1 NAME

NetHack::Item - ???

=head1 VERSION

Version 0.01 released ???

=head1 SYNOPSIS

    use NetHack::Item;

=head1 DESCRIPTION



=head1 AUTHOR

Shawn M Moore, C<< <sartak at gmail.com> >>

=head1 BUGS

No known bugs.

Please report any bugs through RT: email
C<bug-nethack-item at rt.cpan.org>, or browse
L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=NetHack-Item>.

=head1 COPYRIGHT AND LICENSE

Copyright 2008 Shawn M Moore.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

