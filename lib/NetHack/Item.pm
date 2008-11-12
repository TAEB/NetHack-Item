#!/usr/bin/env perl
package NetHack::Item;
use Moose;
use MooseX::AttributeHelpers;

our $VERSION = '0.02';

has raw => (
    is       => 'ro',
    isa      => 'Str',
    required => 1,
);

has identity => (
    is        => 'rw',
    isa       => 'Str',
    predicate => 'has_identity',
);

has appearance => (
    is        => 'rw',
    isa       => 'Str',
    predicate => 'has_appearance',
);

has artifact => (
    is        => 'rw',
    isa       => 'Str',
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

has cost => (
    is      => 'rw',
    isa     => 'Int',
    default => 0,
);

has specific_name => (
    is        => 'rw',
    isa       => 'Str',
    predicate => 'has_specific_name',
    trigger   => sub {
        # recalculate whether this item is an artifact or not (e.g. Sting)
        shift->is_artifact;
    },
);

has generic_name => (
    is        => 'rw',
    isa       => 'Str',
    predicate => 'has_generic_name',
);

for my $type (qw/wield quiver grease offhand/) {
    my $is = "is_$type";

    unless ($type =~ /offhand/) {
        $is .= 'e' unless $is =~ /e$/; # avoid "greaseed"
        $is .= 'd';
    }

    has $is => (
        metaclass => 'Bool',
        is        => 'rw',
        isa       => 'Bool',
        default   => 0,
        provides  => {
            set   => "$type",
            unset => "un$type",
        },
    )
}

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

sub is_holy   { shift->is_blessed(@_) }
sub is_unholy { shift->is_cursed(@_)  }

sub buc {
    my $self = shift;

    if (@_) {
        my $new_buc = shift;
        my $is_new_buc = "is_$new_buc";
        return $self->$is_new_buc(1);
    }

    for my $buc (qw/blessed uncursed cursed/) {
        my $is_buc = "is_$buc";
        return $buc if $self->$is_buc;
    }

    return undef;
}

around BUILDARGS => sub {
    my $orig = shift;
    my $class = shift;

    my $args;
    if (@_ == 1 && !ref($_[0])) {
        $args = { raw => $_[0] };
    }
    else {
        $args = $orig->($class, @_);
    }

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

sub choose_item_class {
    my $self    = shift;
    my $type    = shift;
    my $subtype = shift;

    my $class = "NetHack::Item::" . ucfirst lc $type;
    $class .= '::' . ucfirst lc $subtype
        if $subtype;

    return $class;
}

sub spoiler_class {
    my $self = shift;
    my $type = shift;
    $type ||= $self->type if $self->can('type');

    my $class = $type
              ? "NetHack::Item::Spoiler::" . ucfirst lc $type
              : "NetHack::Item::Spoiler";
    Class::MOP::load_class($class);
    return $class;
}

sub _rebless_into {
    my $self    = shift;
    my $type    = shift;
    my $subtype = shift;

    return if !blessed($self);

    my $class = $self->choose_item_class($type, $subtype);
    my $meta = Class::MOP::load_class($class);
    $meta->rebless_instance($self);
}

sub extract_stats {
    my $self = shift;
    my $raw  = shift || $self->raw;

    my %stats;

    my @fields = qw/slot quantity buc greased poisoned erosion1 erosion2 proofed
                    used eaten diluted enchantment item generic specific
                    recharges charges candles lit_candelabrum lit laid chained
                    quivered offhand offhand_wielded wielded worn cost/;

    # the \b in front of "item name" forbids "Amulet of Yendor" being parsed as
    # "A mulet of Yendor"
    @stats{@fields} = $raw =~ m{
        ^                                                      # anchor
        (?:([\w\#\$])\s[+-]\s)?                           \s*  # slot
        ([Aa]n?|[Tt]he|\d+)?                              \s*  # quantity
        (blessed|(?:un)?cursed|(?:un)?holy)?              \s*  # buc
        (greased)?                                        \s*  # grease
        (poisoned)?                                       \s*  # poison
        ((?:(?:very|thoroughly)\ )?(?:burnt|rusty))?      \s*  # erosion 1
        ((?:(?:very|thoroughly)\ )?(?:rotted|corroded))?  \s*  # erosion 2
        (fixed|(?:fire|rust|corrode)proof)?               \s*  # proofed
        (partly\ used)?                                   \s*  # candles
        (partly\ eaten)?                                  \s*  # food
        (diluted)?                                        \s*  # potions
        ([+-]\d+)?                                        \s*  # enchantment
        (?:(?:pair|set)\ of)?                             \s*  # gloves boots
        \b(.*?)                                           \s*  # item name
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

    # this canonicalization must come early
    if ($stats{item} =~ /^potion of ((?:un)?holy) water$/) {
        $stats{item} = 'potion of water';
        $stats{buc}  = $1;
    }

    if ($stats{item} =~ /^(statue|figurine) of (.*)$/) {
        $stats{item} = $1;
        $stats{$1}   = $2;

        # drop the leading "A lichen" or "THE shopkeeper"
        $stats{$1} =~ s/^(a|the)\s+//;
    }

    # go from japanese to english if possible
    my $spoiler = $self->spoiler_class;

    $stats{item} = $spoiler->japanese_to_english->{$stats{item}}
                || $stats{item};

    # singularize the item if possible
    $stats{item} = $spoiler->singularize($stats{item})
                || $stats{item};

    $stats{type} = $spoiler->name_to_type($stats{item});

    confess "Unknown item type for '$stats{item}' from $raw"
        if !$stats{type};

    # canonicalize the rest of the stats

    $stats{quantity} = 1 if !defined($stats{quantity})
                         || $stats{quantity} =~ /\D/;

    $stats{lit_candelabrum} = ($stats{lit_candelabrum}||'') =~ /lit/;
    $stats{lit} = delete($stats{lit_candelabrum}) || $stats{lit};
    $stats{candles} = 0 if ($stats{candles}||'') eq 'no';

    $stats{worn} = !defined($stats{worn})               ? 0
                 : $stats{worn} =~ /\(on (left|right) / ? $1
                                                        : 1;

    # item damage
    for (qw/burnt rusty rotted corroded/) {
        my $match = ($stats{erosion1}||'') =~ $_ ? $stats{erosion1}
                  : ($stats{erosion2}||'') =~ $_ ? $stats{erosion2}
                                           : 0;

        $stats{$_} = $match ? $match =~ /thoroughly/ ? 3
                            : $match =~ /very/       ? 2
                                                     : 1
                                                     : 0;
    }
    delete @stats{qw/erosion1 erosion2/};

    # boolean stats
    for (qw/greased poisoned used eaten diluted lit laid chained quivered offhand offhand_wielded wielded/) {
        $stats{$_} = defined($stats{$_}) ? 1 : 0;
    }

    # maybe-boolean stats
    for (qw/proofed/) {
        $stats{$_} = defined($stats{$_}) ? 1 : undef;
    }

    # numeric, undef = 0 stats
    for (qw/candles cost/) {
        $stats{$_} = 0 if !defined($stats{$_});
    }

    # strings
    for (qw/generic specific/) {
        $stats{$_} = '' if !defined($stats{$_});
    }

    return \%stats;
}

sub parse_raw {
    my $self = shift;
    my $raw  = shift || $self->raw;

    my $stats = $self->extract_stats($raw);

    # exploit the fact that appearances don't show up in the spoiler table as
    # keys
    $self->_set_appearance_and_identity($stats->{item});

    $self->_rebless_into($stats->{type}, $self->subtype);

    $self->incorporate_stats($stats);
}

sub incorporate_stats {
    my $self  = shift;
    my $stats = shift;

    $self->slot($stats->{slot}) if defined $stats->{slot};
    $self->buc($stats->{buc}) if $stats->{buc};

    $self->quantity($stats->{quantity});
    $self->is_wielded($stats->{wielded});
    $self->is_greased($stats->{greased});
    $self->is_quivered($stats->{quivered});
    $self->is_offhand($stats->{offhand});
    $self->generic_name($stats->{generic}) if defined $stats->{generic};
    $self->specific_name($stats->{specific}) if defined $stats->{specific};
    $self->cost($stats->{cost});
}

sub is_artifact {
    my $self = shift;

    return 1 if $self->artifact;

    my $name = $self->specific_name
        or return 0;

    my $spoiler = $self->spoiler_class->artifact_spoiler($name);

    # is there even an artifact with this name?
    return 0 unless $spoiler;

    # is it the same type as us?
    return 0 unless $spoiler->{type} eq $self->type;

    # is it the EXACT name? (e.g. "gray stone named heart of ahriman" fails
    # because it's not properly capitalized and doesn't have "The"
    my $arti_name = $spoiler->{fullname}
                 || $spoiler->{name};
    return 0 unless $arti_name eq $name;

    # if we know our appearance, is it a possible appearance for the
    # artifact?
    if (my $appearance = $self->appearance) {
        return 0 unless grep { $appearance eq ($_||'') }
                        $spoiler->{appearance},
                        @{ $spoiler->{appearances} };
    }

    # if we know our identity, is the artifact's identity the same as ours?
    # if so, then we can know definitively whether this is the artifact
    # or not (see below)
    if (my $identity = $self->identity) {
        if ($identity eq $spoiler->{base}) {
            $self->artifact($spoiler->{name});
            return 1;
        }
        else {
            return 0;
        }
    }

    # otherwise, the best we can say is "maybe". consider the artifact
    # naming bug.  we may have a pyramidal amulet that is named The Eye of
    # the Aethiopica. the naming bug exploits the fact that if pyramidal is
    # NOT ESP, then it will correctly name the amulet. if pyramidal IS ESP
    # then we cannot name it correctly -- the only pyramidal amulet that
    # can have the name is the real Eye

    return undef;
}

sub _set_appearance_and_identity {
    my $self       = shift;
    my $best_match = shift;

    if (my $spoiler = $self->spoiler_class->spoiler_for($best_match)) {
        if ($spoiler->{artifact}) {
            $self->artifact($spoiler->{name});
            $spoiler = $self->spoiler_class->spoiler_for($spoiler->{base})
                if $spoiler->{base};
        }

        $self->identity($spoiler->{name});
        if (defined(my $appearance = $spoiler->{appearance})) {
            $self->appearance($appearance);
        }
    }
    else {
        $self->appearance($best_match);
        my @possibilities = $self->possibilities;
        if (@possibilities == 1 && $best_match ne $possibilities[0]) {
            $self->_set_appearance_and_identity($possibilities[0]);
        }
    }

    # this does an update if everything checks out
    $self->is_artifact;
}

sub possibilities {
    my $self = shift;
    return $self->identity if $self->has_identity;
    return sort @{ $self->spoiler_class->possibilities_for_appearance($self->appearance) };
}

sub spoiler {
    my $self = shift;
    return unless $self->has_identity;
    return $self->spoiler_class->spoiler_for($self->identity);
}

sub all_spoilers {
    my $self = shift;

    return map { $self->spoiler_class->spoiler_for($_) } $self->possibilities;
}

sub spoiler_values {
    my $self = shift;
    my $key  = shift;

    return map { $_->{$key} } $self->all_spoilers;
}

sub collapse_spoiler_value {
    my $self = shift;
    my $key  = shift;

    my @values = $self->spoiler_values($key);
    my $value = shift @values;
    return undef if !defined($value);

    for (@values) {
        return undef if !defined($_) || $_ ne $value;
    }

    return $value;
}

sub subtype {
    my $self = shift;
    $self->collapse_spoiler_value('subtype');
}

sub can_drop { 1 }

__PACKAGE__->meta->make_immutable;
no Moose;

1;

__END__

=head1 NAME

NetHack::Item - parse and interact with a NetHack item

=head1 SYNOPSIS

    use NetHack::Item;
    my $item = NetHack::Item->new("f - a wand of wishing named SWEET (0:3)" );

    $item->slot           # f
    $item->type           # wand
    $item->specific_name  # SWEET
    $item->charges        # 3

    $item->spend_charge;
    $item->wield;
    $item->buc("blessed");

    $item->charges        # 2
    $item->is_wielded     # 1
    $item->is_blessed     # 1
    $item->is_cursed      # 0

=head1 DESCRIPTION

NetHack's items are complex beasts. This library attempts to control that
complexity.

=head1 ATTRIBUTES

These are the attributes common to every NetHack item. Subclasses (e.g. Wand)
may have additional attributes.

=over 4

=item raw

The raw string passed in to L</new>, to be parsed. This is the only required
attribute.

=item identity

The identity of the item (a string). For example, "clear potion" will be
"potion of water". For artifacts, the base item is used for identity, so for
"the Eye of the Aethiopica" you'll have "amulet of ESP".

=item appearance

The appearance of the item (a string). For example, "potion of water" will be
"clear potion". For artifacts, the base item is used for appearance, so for
"the Eye of the Aethiopica" you'll have "pyramidal amulet" (or any of the
random appearances for amulets of ESP).

=item artifact

The name of the artifact, if applicable. The leading "The" is stripped (so
you'll have "Eye of the Aethiopica").

=item slot

The inventory or container slot in which this item resides. Obviously not
applicable to items on the ground.

=item quantity

The item stack's quantity. Usually 1.

=item cost

The amount of zorkmids that a shopkeeper is demanding for this item.

=item specific_name

A name for this specific item, as opposed to a name for all items of this
class. Artifacts use specific name.

=item generic_name

A name for all items of this class, as opposed to a name for a specific item.
Identification uses generic name.

=item is_wielded, is_quivered, is_greased, is_offhand

Interesting boolean states of an item.

=item is_blessed, is_cursed, is_uncursed

Boolean states about the BUC status of an item. If one returns true, the others
will return false.

=item buc

Returns "blessed", "cursed", "uncursed", or C<undef>.

=item is_holy, is_unholy

Synonyms for L</is_blessed> and L</is_cursed>.

=back

=head1 SEE ALSO

L<http://sartak.org/code/TAEB/>

=head1 AUTHOR

Shawn M Moore, C<< <sartak@gmail.com> >>

Jesse Luehrs, C<< <jluehrs2@uiuc.edu> >>

=head1 BUGS

No known bugs.

Please report any bugs through RT: email
C<bug-nethack-item at rt.cpan.org>, or browse
L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=NetHack-Item>.

=head1 COPYRIGHT AND LICENSE

Copyright 2008 Shawn M Moore and Jesse Luehrs.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

