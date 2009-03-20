package NetHack::Item::Spoiler::Food;
use strict;
use warnings;
use base 'NetHack::Item::Spoiler';
use NetHack::Monster::Spoiler;

use constant type => 'food';

sub _list {
    my $food = {
        'meatball' => {
            price => 5, weight => 1, nutrition => 5, time => 1,
            plural => 'meatballs', stackable => 1, material => 'flesh',
            vegan => 0, vegetarian => 0,
        },
        'meat ring' => {
            price => 5, weight => 1, nutrition => 5, time => 1,
            plural => 'meat rings', stackable => 0, material => 'flesh',
            vegan => 0, vegetarian => 0,
        },
        'meat stick' => {
            price => 5, weight => 1, nutrition => 5, time => 1,
            plural => 'meat sticks', stackable => 1, material => 'flesh',
            vegan => 0, vegetarian => 0,
        },
        'tripe ration' => {
            price => 15, weight => 10, nutrition => 200, time => 2, unsafe => 1,
            plural => 'tripe rations', stackable => 1, material => 'flesh',
            vegan => 0, vegetarian => 0,
        },
        'huge chunk of meat' => {
            price => 105, weight => 400, nutrition => 2000, time => 20,
            plural => 'huge chunks of meat', stackable => 1,
            material => 'flesh',
            vegan => 0, vegetarian => 0,
        },
        'kelp frond' => {
            price => 6, weight => 1, nutrition => 30, time => 1,
            plural => 'kelp fronds', stackable => 1, material => 'veggy',
            vegan => 1, vegetarian => 1,
        },
        'eucalyptus leaf' => {
            price => 6, weight => 1, nutrition => 30, time => 1,
            plural => 'eucalyptus leaves', stackable => 1, material => 'veggy',
            vegan => 1, vegetarian => 1,
        },
        'clove of garlic' => {
            price => 7, weight => 1, nutrition => 40, time => 1,
            plural => 'cloves of garlic', stackable => 1, material => 'veggy',
            vegan => 1, vegetarian => 1,
        },
        'sprig of wolfsbane' => {
            price => 7, weight => 1, nutrition => 40, time => 1,
            plural => 'sprigs of wolfsbane', stackable => 1,
            material => 'veggy',
            vegan => 1, vegetarian => 1,
        },
        'apple' => {
            price => 7, weight => 2, nutrition => 50, time => 1,
            plural => 'apples', stackable => 1, material => 'veggy',
            vegan => 1, vegetarian => 1,
        },
        'carrot' => {
            price => 7, weight => 2, nutrition => 50, time => 1,
            plural => 'carrots', stackable => 1, material => 'veggy',
            vegan => 1, vegetarian => 1,
        },
        'pear' => {
            price => 7, weight => 2, nutrition => 50, time => 1,
            plural => 'pears', stackable => 1, material => 'veggy',
            vegan => 1, vegetarian => 1,
        },
        'banana' => {
            price => 9, weight => 2, nutrition => 80, time => 1,
            plural => 'bananas', stackable => 1, material => 'veggy',
            vegan => 1, vegetarian => 1,
        },
        'orange' => {
            price => 9, weight => 2, nutrition => 80, time => 1,
            plural => 'oranges', stackable => 1, material => 'veggy',
            vegan => 1, vegetarian => 1,
        },
        'melon' => {
            price => 10, weight => 5, nutrition => 100, time => 1,
            plural => 'melons', stackable => 1, material => 'veggy',
            vegan => 1, vegetarian => 1,
        },
        'slime mold' => {
            price => 17, weight => 5, nutrition => 250, time => 1,
            plural => 'slime molds', stackable => 1, material => 'veggy',
            vegan => 1, vegetarian => 1,
        },
        'fortune cookie' => {
            price => 7, weight => 1, nutrition => 40, time => 1,
            plural => 'fortune cookies', stackable => 1, material => 'veggy',
            vegan => 0, vegetarian => 1,
        },
        'candy bar' => {
            price => 10, weight => 2, nutrition => 100, time => 1,
            plural => 'candy bars', stackable => 1, material => 'veggy',
            vegan => 0, vegetarian => 1,
        },
        'cream pie' => {
            price => 10, weight => 10, nutrition => 100, time => 1,
            plural => 'cream pies', stackable => 1, material => 'veggy',
            vegan => 0, vegetarian => 1,
        },
        'lump of royal jelly' => {
            price => 15, weight => 2, nutrition => 200, time => 1,
            plural => 'lumps of royal jelly', stackable => 1,
            material => 'veggy',
            vegan => 0, vegetarian => 1,
        },
        'pancake' => {
            price => 15, weight => 2, nutrition => 200, time => 2,
            plural => 'pancakes', stackable => 1, material => 'veggy',
            vegan => 0, vegetarian => 1,
        },
        'C-ration' => {
            price => 20, weight => 10, nutrition => 300, time => 1,
            plural => 'C-rations', stackable => 1, material => 'veggy',
            vegan => 1, vegetarian => 1,
        },
        'K-ration' => {
            price => 25, weight => 10, nutrition => 400, time => 1,
            plural => 'K-rations', stackable => 1, material => 'veggy',
            vegan => 1, vegetarian => 1,
        },
        'cram ration' => {
            price => 35, weight => 15, nutrition => 600, time => 3,
            plural => 'cram rations', stackable => 1, material => 'veggy',
            vegan => 1, vegetarian => 1,
        },
        'food ration' => {
            price => 45, weight => 20, nutrition => 800, time => 5,
            plural => 'food rations', stackable => 1, material => 'veggy',
            vegan => 1, vegetarian => 1,
        },
        'lembas wafer' => {
            price => 45, weight => 5, nutrition => 800, time => 2,
            plural => 'lembas wafers', stackable => 1, material => 'veggy',
            vegan => 1, vegetarian => 1,
        },
        'empty tin' => {
            price => 5, weight => 10, nutrition => 0,
            plural => 'empty tins', stackable => 1, material => 'metal',
            appearance => 'tin',
            vegan => 1, vegetarian => 1,
        },
        'tin of spinach' => {
            price => 5, weight => 10, nutrition => 800,
            plural => 'tins of spinach', stackable => 1, material => 'metal',
            appearance => 'tin',
            vegan => 1, vegetarian => 1,
        },
    };

    for my $monster (NetHack::Monster::Spoiler->list) {
        next if $monster->never_drops_corpse;

        my $monster_name = $monster->name;
        my $item = $monster_name;
        if ($monster->is_unique) {
            $item .= ($item =~ /s$/ ? "'" : "'s");
            $item = "the " . $item unless $monster->has_proper_name;
        }

        my $corpse_name = "$item corpse";
        (my $corpse_plural = $corpse_name) =~ s/corpse$/corpses/;
        my $tin_name = "tin of $monster_name";
        $tin_name .= ' meat' unless $monster->vegetarian;
        (my $tin_plural = $tin_name) =~ s/^tin/tins/;
        my $egg_name = "$item egg";
        (my $egg_plural = $egg_name) =~ s/egg$/eggs/;

        $food->{$corpse_name} = {
            nutrition  => $monster->corpse_nutrition,
            plural     => $corpse_plural,
            appearance => $corpse_name,
            weight     => $monster->weight,
            stackable  => 1,
            material   => 'flesh',
            subtype    => 'corpse',
            price      => 5,
            monster    => $monster,
            permanent  => ($monster_name eq 'lizard'
                        || $monster_name eq 'lichen'),
            vegan      => $monster->vegan,
            vegetarian => $monster->vegetarian,
            time       => 3 + ($monster->weight >> 6),
            reanimates => $monster->corpse_reanimates,
            effects    => $monster->corpse,
        };

        $food->{$tin_name} = {
            plural     => $tin_plural,
            appearance => 'tin',
            weight     => 10,
            stackable  => 1,
            material   => 'metal',
            price      => 5,
            monster    => $monster,
            vegan      => $monster->vegan,
            vegetarian => $monster->vegetarian,
            effects    => $monster->corpse,
        };

        if ($monster->lays_eggs) {
            $food->{$egg_name} = {
                nutrition  => 80,
                plural     => $egg_plural,
                appearance => 'egg',
                weight     => 1,
                stackable  => 1,
                material   => 'flesh',
                price      => 9,
                monster    => $monster,
                vegan      => 0,
                vegetarian => 0,
                time       => 1,
                effects    => {
                    vomit   => 1,
                }
            };
            $food->{$egg_name}{effects}{petrify} = 1
                if $monster->touch_petrifies;
        }
    }

    return $food;
}

sub extra_plurals {
    return {
        tin => 'tins',
        egg => 'eggs',
    };
}

1;

