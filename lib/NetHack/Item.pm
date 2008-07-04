#!/usr/bin/env perl
package NetHack::Item;
use Moose;

our $VERSION = '0.01';

has raw => (
    is       => 'ro',
    isa      => 'Str',
    required => 1,
);

for my $type (qw/is_blessed is_uncursed is_cursed/) {
    my %others = map { $_ => 1 } qw/is_blessed is_uncursed is_cursed/;
    delete $others{$type};

    has $type => (
        is      => 'rw',
        isa     => 'Bool',
        trigger => sub {
            my $self = shift;
            my $set  = shift;

            if ($set) {
                $self->$_(0) for keys %others;
            }
        },
    );
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

    return $args;
};

sub BUILD {
    my $self = shift;
    my $args = shift;

    if ($args->{type}) {
        my $class = "NetHack::Item::" . ucfirst lc $args->{type};
        my $meta = Class::MOP::load_class($class);
        $meta->rebless_instance($self);
    }

    $self->parse_raw;
}

sub parse_raw {
    my $self = shift;
    my $raw = $self->raw;

    # this regex was written by Jesse Luehrs
    my ($slot, $num, $buc, $greased, $poisoned, $ero1, $ero2, $proof, $used,
        $eaten, $dilute, $spe, $item, $call, $name, $recharges, $charges,
        $ncandles, $lit_candelabrum, $lit, $laid, $chain, $quiver, $offhand,
        $wield, $wear, $price) = $raw =~
        m{^                                                # anchor the regex
          (?:([\w\#\$])\s[+-]\s)?\s*                       # inventory slot
          ([Aa]n?|[Tt]he|\d+)?\s*                          # number
          (blessed|(?:un)?cursed|(?:un)?holy)?\s*          # cursedness
          (greased)?\s*                                    # greasy
          (poisoned)?\s*                                   # poisoned
          ((?:(?:very|thoroughly)\ )?(?:burnt|rusty))?\s*  # erosion 1
          ((?:(?:very|thoroughly)\ )?(?:rotted|corroded))?\s* # erosion 2
          (fixed|(?:fire|rust|corrode)proof)?\s*           # fooproof
          (partly\ used)?\s*                               # candles
          (partly\ eaten)?\s*                              # food
          (diluted)?\s*                                    # potions
          ([+-]\d+)?\s*                                    # enchantment
          (?:(?:pair|set)\ of)?\s*                         # gloves and boots
          (.*?)\s*                                         # item name
          (?:called\ (.*?))?\s*                            # non-specific name
          (?:named\ (.*?))?\s*                             # specific name
          (?:\((\d+):(-?\d+)\))?\s*                        # charges
          (?:\((no|[1-7])\ candles?(,\ lit|\ attached)\))?\s* # lit candelabrum
          (\(lit\))?\s*                                    # lit
          (\(laid\ by\ you\))?\s*                          # eggs
          (\(chained\ to\ you\))?\s*                       # iron balls
          (\(in\ quiver\))?\s*                             # quivered
          (\(alternate\ weapon;\ not\ wielded\))?\s*       # off-hand weapon
          (\(weapon.*?\))?\s*                              # wielding
          (\((?:being|embedded|on).*?\))?\s*               # wearing
          (?:\(unpaid,\ (\d+)\ zorkmids?\))?\s*            # shops
          $                                                # anchor the regex
         }x;

    if ($buc) {
        my $is_buc = "is_$buc";

        my %set_to_zero = map { $_ => 1 } qw/is_blessed is_uncursed is_cursed/;
        delete $set_to_zero{$is_buc};

        my $method = "$is_buc";
        $self->$method(1);

        $self->$_(0) for keys %set_to_zero;
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

