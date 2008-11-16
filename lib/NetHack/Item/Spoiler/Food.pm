#!/usr/bin/env perl
package NetHack::Item::Spoiler::Food;
use strict;
use warnings;
use base 'NetHack::Item::Spoiler';

use constant type => 'food';

sub _list {
    my $food = {
        'meatball' => {
            price => 5, weight => 1, nutrition => 5, time => 1,
            plural => 'meatballs',
        },
        'meat ring' => {
            price => 5, weight => 1, nutrition => 5, time => 1,
            plural => 'meat rings',
        },
        'meat stick' => {
            price => 5, weight => 1, nutrition => 5, time => 1,
            plural => 'meat sticks',
        },
        'tripe ration' => {
            price => 15, weight => 10, nutrition => 200, time => 2, unsafe => 1,
            plural => 'tripe rations',
        },
        'huge chunk of meat' => {
            price => 105, weight => 400, nutrition => 2000, time => 20,
            plural => 'huge chunks of meat',
        },
        'kelp frond' => {
            price => 6, weight => 1, nutrition => 30, time => 1,
            plural => 'kelp fronds',
        },
        'eucalyptus leaf' => {
            price => 6, weight => 1, nutrition => 30, time => 1,
            plural => 'eucalyptus leaves',
        },
        'clove of garlic' => {
            price => 7, weight => 1, nutrition => 40, time => 1,
            plural => 'cloves of garlic',
        },
        'sprig of wolfsbane' => {
            price => 7, weight => 1, nutrition => 40, time => 1,
            plural => 'sprigs of wolfsbane',
        },
        'apple' => {
            price => 7, weight => 2, nutrition => 50, time => 1,
            plural => 'apples',
        },
        'carrot' => {
            price => 7, weight => 2, nutrition => 50, time => 1,
            plural => 'carrots',
        },
        'pear' => {
            price => 7, weight => 2, nutrition => 50, time => 1,
            plural => 'pears',
        },
        'banana' => {
            price => 9, weight => 2, nutrition => 80, time => 1,
            plural => 'bananas',
        },
        'orange' => {
            price => 9, weight => 2, nutrition => 80, time => 1,
            plural => 'oranges',
        },
        'melon' => {
            price => 10, weight => 5, nutrition => 100, time => 1,
            plural => 'melons',
        },
        'slime mold' => {
            price => 17, weight => 5, nutrition => 250, time => 1,
            plural => 'slime molds',
        },
        'fortune cookie' => {
            price => 7, weight => 1, nutrition => 40, time => 1,
            plural => 'fortune cookies',
        },
        'candy bar' => {
            price => 10, weight => 2, nutrition => 100, time => 1,
            plural => 'candy bars',
        },
        'cream pie' => {
            price => 10, weight => 10, nutrition => 100, time => 1,
            plural => 'cream pies',
        },
        'lump of royal jelly' => {
            price => 15, weight => 2, nutrition => 200, time => 1,
            plural => 'lumps of royal jelly',
        },
        'pancake' => {
            price => 15, weight => 2, nutrition => 200, time => 2,
            plural => 'pancakes',
        },
        'C-ration' => {
            price => 20, weight => 10, nutrition => 300, time => 1,
            plural => 'C-rations',
        },
        'K-ration' => {
            price => 25, weight => 10, nutrition => 400, time => 1,
            plural => 'K-rations',
        },
        'cram ration' => {
            price => 35, weight => 15, nutrition => 600, time => 3,
            plural => 'cram rations',
        },
        'food ration' => {
            price => 45, weight => 20, nutrition => 800, time => 5,
            plural => 'food rations',
        },
        'lembas wafer' => {
            price => 45, weight => 5, nutrition => 800, time => 2,
            plural => 'lembas wafers',
        },
        'empty tin' => {
            nutrition  => 0,
            plural     => 'empty tins',
            appearance => 'tin',
        },
        'tin of spinach' => {
            nutrition  => 800,
            plural     => 'tins of spinach',
            appearance => 'tin',
        },
    };

    my %monsterlist = (
        'Aleax' => {
            weight      => 1450,
            nutrition   => 0,
        },
        'Angel' => {
            weight      => 1450,
            nutrition   => 0,
        },
        'Arch Priest' => {
            unique    => 1,
            cannibal    => "Hum",
            weight      => 1450,
            nutrition   => 400,
        },
        'Archon' => {
            weight      => 1450,
            nutrition   => 0,
        },
        'Ashikaga Takauji' => {
            unique      => 1,
            weight      => 1450,
            nutrition   => 0,
        },
        'Asmodeus' => {
            unique      => 1,
            weight      => 1500,
            nutrition   => 0,
        },
        'Baalzebub' => {
            unique      => 1,
            weight      => 1500,
            nutrition   => 0,
        },
        'Chromatic Dragon' => {
            unique      => 1,
            weight      => 4500,
            nutrition   => 1700,
            cold        => '17%',
            disintegration   => '17%',
            fire        => '17%',
            poison      => '17%',
            poisonous   => '100%',
            shock       => '17%',
            sleep       => '17%',
        },
        'Croesus' => {
            unique      => 1,
            cannibal    => "Hum",
            weight      => 1450,
            nutrition   => 400,
        },
        'Cyclops' => {
            unique      => 1,
            weight      => 1900,
            nutrition   => 700,
            strength    => '100%',
        },
        'Dark One' => {
            unique      => 1,
            weight      => 1450,
            nutrition   => 0,
        },
        'Death' => {
            unique      => 1,
            weight      => 1450,
            nutrition   => 1,
            die         => '100%',
        },
        'Demogorgon' => {
            unique      => 1,
            weight      => 1500,
            nutrition   => 0,
        },
        'Dispater' => {
            unique      => 1,
            weight      => 1500,
            nutrition   => 0,
        },
        'Elvenking' => {
            cannibal    => "Elf",
            weight      => 800,
            nutrition   => 350,
            sleep       => '60%',
        },
        'Famine' => {
            unique      => 1,
            weight      => 1450,
            nutrition   => 1,
            die         => '100%',
        },
        'Geryon' => {
            unique      => 1,
            weight      => 1500,
            nutrition   => 0,
        },
        'Grand Master' => {
            unique      => 1,
            cannibal    => "Hum",
            weight      => 1450,
            nutrition   => 400,
        },
        'Green-elf' => {
            cannibal    => "Elf",
            weight      => 800,
            nutrition   => 350,
            sleep       => '33%',
        },
        'Grey-elf' => {
            cannibal    => "Elf",
            weight      => 800,
            nutrition   => 350,
            sleep       => '40%',
        },
        'Hippocrates' => {
            unique      => 1,
            cannibal    => "Hum",
            weight      => 1450,
            nutrition   => 400,
        },
        'Ixoth' => {
            unique      => 1,
            weight      => 4500,
            nutrition   => 1600,
            fire        => '100%',
        },
        'Juiblex' => {
            unique      => 1,
            weight      => 1500,
            nutrition   => 0,
        },
        'Keystone Kop' => {
            cannibal    => "Hum",
            weight      => 1450,
            nutrition   => 200,
        },
        'King Arthur' => {
            unique      => 1,
            cannibal    => "Hum",
            weight      => 1450,
            nutrition   => 400,
        },
        'Kop Kaptain' => {
            cannibal    => "Hum",
            weight      => 1450,
            nutrition   => 200,
        },
        'Kop Lieutenant' => {
            cannibal    => "Hum",
            weight      => 1450,
            nutrition   => 200,
        },
        'Kop Sergeant' => {
            cannibal    => "Hum",
            weight      => 1450,
            nutrition   => 200,
        },
        'Lord Carnarvon' => {
            unique      => 1,
            cannibal    => "Hum",
            weight      => 1450,
            nutrition   => 400,
        },
        'Lord Sato' => {
            unique      => 1,
            cannibal    => "Hum",
            weight      => 1450,
            nutrition   => 400,
        },
        'Lord Surtur' => {
            unique      => 1,
            weight      => 2250,
            nutrition   => 850,
            fire        => '50%',
            strength    => '100%',
        },
        'Master Assassin' => {
            unique      => 1,
            cannibal    => "Hum",
            weight      => 1450,
            nutrition   => 400,
        },
        'Master Kaen' => {
            unique      => 1,
            cannibal    => "Hum",
            weight      => 1450,
            nutrition   => 400,
            poison      => '100%',
        },
        'Master of Thieves' => {
            unique      => 1,
            cannibal    => "Hum",
            weight      => 1450,
            nutrition   => 400,
        },
        'Medusa' => {
            unique      => 1,
            weight      => 1450,
            nutrition   => 400,
            petrify   => '100%',
            poison      => '100%',
            poisonous   => '100%',
        },
        'Minion of Huhetotl' => {
            unique      => 1,
            weight      => 1450,
            nutrition   => 0,
        },
        'Mordor orc' => {
            weight      => 1200,
            nutrition   => 200,
        },
        'Nalzok' => {
            unique      => 1,
            weight      => 1450,
            nutrition   => 0,
        },
        'Nazgul' => {
            weight      => 1450,
            nutrition   => 0,
        },
        'Neferet the Green' => {
            unique      => 1,
            cannibal    => "Hum",
            weight      => 1450,
            nutrition   => 400,
        },
        'Norn' => {
            unique      => 1,
            cannibal    => "Hum",
            weight      => 1450,
            nutrition   => 400,
        },
        'Olog-hai' => {
            weight      => 1500,
            nutrition   => 400,
        },
        'Oracle' => {
            unique      => 1,
            cannibal    => "Hum",
            weight      => 1450,
            nutrition   => 400,
        },
        'Orcus' => {
            unique      => 1,
            weight      => 1500,
            nutrition   => 0,
        },
        'Orion' => {
            unique      => 1,
            cannibal    => "Hum",
            weight      => 1450,
            nutrition   => 400,
        },
        'Pelias' => {
            unique      => 1,
            cannibal    => "Hum",
            weight      => 1450,
            nutrition   => 400,
        },
        'Pestilence' => {
            unique      => 1,
            weight      => 1450,
            nutrition   => 1,
            die         => '100%',
        },
        'Scorpius' => {
            unique      => 1,
            weight      => 750,
            nutrition   => 350,
            poison      => '100%',
            poisonous   => '100%',
        },
        'Shaman Karnov' => {
            unique      => 1,
            cannibal    => "Hum",
            weight      => 1450,
            nutrition   => 400,
        },
        'Thoth Amon' => {
            unique      => 1,
            weight      => 1450,
            nutrition   => 0,
        },
        'Twoflower' => {
            unique      => 1,
            cannibal    => "Hum",
            weight      => 1450,
            nutrition   => 400,
        },
        'Uruk-hai' => {
            weight      => 1300,
            nutrition   => 300,
        },
        'Vlad the Impaler' => {
            unique      => 1,
            weight      => 1450,
            nutrition   => 0,
        },
        'Wizard of Yendor' => {
            unique      => 1,
            cannibal    => "Hum",
            weight      => 1450,
            nutrition   => 400,
            fire        => '25%',
            poison      => '25%',
            'teleport control' => '25%',
            teleportitis   => '25%',
        },
        'Woodland-elf' => {
            cannibal    => "Elf",
            weight      => 800,
            nutrition   => 350,
            sleep       => '27%',
        },
        'Yeenoghu' => {
            unique      => 1,
            weight      => 900,
            nutrition   => 0,
        },
        'abbot' => {
            cannibal      => "Hum",
            weight        => 1450,
            nutrition     => 400,
            hallucination => '100%',
        },
        'acid blob' => {
            weight      => 30,
            nutrition   => 10,
            acidic      => '100%',
            vegetarian  => 1,
            vegan       => 1,
        },
        'acolyte' => {
            cannibal    => "Hum",
            weight      => 1450,
            nutrition   => 400,
        },
        'air elemental' => {
            weight      => 0,
            nutrition   => 0,
            vegetarian  => 1,
            vegan       => 1,
        },
        'aligned priest' => {
            weight      => 1450,
            nutrition   => 400,
        },
        'ape' => {
            weight      => 1100,
            nutrition   => 500,
        },
        'apprentice' => {
            cannibal    => "Hum",
            weight      => 1450,
            nutrition   => 400,
        },
        'arch-lich' => {
            weight      => 1200,
            nutrition   => 0,
        },
        'archeologist' => {
            cannibal    => "Hum",
            weight      => 1450,
            nutrition   => 400,
        },
        'attendant' => {
            cannibal    => "Hum",
            weight      => 1450,
            nutrition   => 400,
        },
        'baby black dragon' => {
            weight      => 1500,
            nutrition   => 500,
        },
        'baby blue dragon' => {
            weight      => 1500,
            nutrition   => 500,
        },
        'baby crocodile' => {
            weight      => 200,
            nutrition   => 200,
        },
        'baby gray dragon' => {
            weight      => 1500,
            nutrition   => 500,
        },
        'baby green dragon' => {
            weight      => 1500,
            nutrition   => 500,
            poisonous   => '100%',
        },
        'baby long worm' => {
            weight      => 600,
            nutrition   => 250,
        },
        'baby orange dragon' => {
            weight      => 1500,
            nutrition   => 500,
        },
        'baby purple worm' => {
            weight      => 600,
            nutrition   => 250,
        },
        'baby red dragon' => {
            weight      => 1500,
            nutrition   => 500,
        },
        'baby silver dragon' => {
            weight      => 1500,
            nutrition   => 500,
        },
        'baby white dragon' => {
            weight      => 1500,
            nutrition   => 500,
        },
        'baby yellow dragon' => {
            weight      => 1500,
            nutrition   => 500,
            acidic      => '100%',
        },
        'balrog' => {
            weight      => 1450,
            nutrition   => 0,
        },
        'baluchitherium' => {
            weight      => 3800,
            nutrition   => 800,
        },
        'barbarian' => {
            cannibal    => "Hum",
            weight      => 1450,
            nutrition   => 400,
        },
        'barbed devil' => {
            weight      => 1450,
            nutrition   => 0,
        },
        'barrow wight' => {
            weight      => 1200,
            nutrition   => 0,
        },
        'bat' => {
            weight      => 20,
            nutrition   => 20,
            stun   => '30',
        },
        'black dragon' => {
            has_egg     => 1,
            weight      => 4500,
            nutrition   => 1500,
            disintegration   => '100%',
        },
        'black light' => {
            weight      => 0,
            nutrition   => 0,
            vegetarian  => 1,
            vegan       => 1,
        },
        'black naga' => {
            has_egg     => 1,
            weight      => 2600,
            nutrition   => 400,
            acidic      => '100%',
            poison      => '53%',
        },
        'black naga hatchling' => {
            weight      => 500,
            nutrition   => 100,
            acidic      => '100%',
            poison      => '20%',
        },
        'black pudding' => {
            weight      => 900,
            nutrition   => 250,
            acidic      => '100%',
            cold        => '22%',
            poison      => '22%',
            shock       => '22%',
        },
        'black unicorn' => {
            weight      => 1300,
            nutrition   => 300,
            poison      => '27%',
        },
        'blue dragon' => {
            has_egg     => 1,
            weight      => 4500,
            nutrition   => 1500,
            shock       => '100%',
        },
        'blue jelly' => {
            weight      => 50,
            nutrition   => 20,
            cold        => '13%',
            poison      => '13%',
            vegetarian  => 1,
            vegan       => 1,
        },
        'bone devil' => {
            weight      => 1450,
            nutrition   => 0,
        },
        'brown mold' => {
            weight      => 50,
            nutrition   => 30,
            cold        => '3%',
            poison      => '3%',
            vegetarian  => 1,
            vegan       => 1,
        },
        'brown pudding' => {
            weight      => 500,
            nutrition   => 250,
            acidic      => '100%',
            cold        => '11%',
            poison      => '11%',
            shock       => '11%',
            vegetarian  => 1,
        },
        'bugbear' => {
            weight      => 1250,
            nutrition   => 250,
        },
        'captain' => {
            cannibal    => "Hum",
            weight      => 1450,
            nutrition   => 400,
        },
        'carnivorous ape' => {
            weight      => 1250,
            nutrition   => 550,
        },
        'cave spider' => {
            has_egg     => 1,
            weight      => 50,
            nutrition   => 50,
            poison      => '7%',
        },
        'caveman' => {
            cannibal    => "Hum",
            weight      => 1450,
            nutrition   => 400,
        },
        'cavewoman' => {
            cannibal    => "Hum",
            weight      => 1450,
            nutrition   => 400,
        },
        'centipede' => {
            has_egg     => 1,
            weight      => 50,
            nutrition   => 50,
            poison      => '13%',
        },
        'chameleon' => {
            weight      => 100,
            nutrition   => 100,
            polymorph   => '100%',
        },
        'chickatrice' => {
            weight      => 10,
            nutrition   => 10,
            petrify   => '100%',
            poison      => '27%',
        },
        'chieftain' => {
            cannibal    => "Hum",
            weight      => 1450,
            nutrition   => 400,
        },
        'clay golem' => {
            weight      => 1550,
            nutrition   => 0,
        },
        'cobra' => {
            has_egg     => 1,
            weight      => 250,
            nutrition   => 100,
            poison      => '40%',
            poisonous   => '100%',
        },
        'cockatrice' => {
            has_egg     => 1,
            weight      => 30,
            nutrition   => 30,
            petrify   => '100%',
            poison      => '33%',
        },
        'couatl' => {
            weight      => 900,
            nutrition   => 0,
        },
        'coyote' => {
            weight      => 300,
            nutrition   => 250,
        },
        'crocodile' => {
            has_egg     => 1,
            weight      => 1450,
            nutrition   => 400,
        },
        'demilich' => {
            weight      => 1200,
            nutrition   => 0,
        },
        'dingo' => {
            weight      => 400,
            nutrition   => 200,
        },
        'disenchanter' => {
            weight      => 750,
            nutrition   => 200,
        },
        'djinni' => {
            weight      => 1500,
            nutrition   => 0,
        },
        'dog' => {
            weight      => 400,
            nutrition   => 200,
            aggravate   => '100%',
        },
        'doppelganger' => {
            cannibal    => "Hum",
            weight      => 1450,
            nutrition   => 400,
            polymorph   => '100%',
        },
        'dust vortex' => {
            weight      => 0,
            nutrition   => 0,
            vegetarian  => 1,
            vegan       => 1,
        },
        'dwarf' => {
            cannibal    => "Dwa",
            weight      => 900,
            nutrition   => 300,
        },
        'dwarf king' => {
            cannibal    => "Dwa",
            weight      => 900,
            nutrition   => 300,
        },
        'dwarf lord' => {
            cannibal    => "Dwa",
            weight      => 900,
            nutrition   => 300,
        },
        'dwarf mummy' => {
            weight      => 900,
            nutrition   => 150,
        },
        'dwarf zombie' => {
            weight      => 900,
            nutrition   => 150,
        },
        'earth elemental' => {
            weight      => 2500,
            nutrition   => 0,
            vegetarian  => 1,
            vegan       => 1,
        },
        'electric eel' => {
            has_egg     => 1,
            weight      => 200,
            nutrition   => 250,
            shock       => '47%',
        },
        'elf' => {
            cannibal    => "Elf",
            weight      => 800,
            nutrition   => 350,
            sleep       => '67%',
        },
        'elf mummy' => {
            weight      => 800,
            nutrition   => 175,
        },
        'elf zombie' => {
            weight      => 800,
            nutrition   => 175,
        },
        'elf-lord' => {
            cannibal    => "Elf",
            weight      => 800,
            nutrition   => 350,
            sleep       => '53%',
        },
        'energy vortex' => {
            weight      => 0,
            nutrition   => 0,
            vegetarian  => 1,
            vegan       => 1,
        },
        'erinys' => {
            weight      => 1450,
            nutrition   => 0,
        },
        'ettin' => {
            weight      => 1700,
            nutrition   => 500,
        },
        'ettin mummy' => {
            weight      => 1700,
            nutrition   => 250,
        },
        'ettin zombie' => {
            weight      => 1700,
            nutrition   => 250,
        },
        'fire ant' => {
            has_egg     => 1,
            weight      => 30,
            nutrition   => 10,
            fire        => '20%',
        },
        'fire elemental' => {
            weight      => 0,
            nutrition   => 0,
            vegetarian  => 1,
            vegan       => 1,
        },
        'fire giant' => {
            weight      => 2250,
            nutrition   => 750,
            fire        => '30%',
            strength    => '100%',
        },
        'fire vortex' => {
            weight      => 0,
            nutrition   => 0,
            vegetarian  => 1,
            vegan       => 1,
        },
        'flaming sphere' => {
            weight      => 10,
            nutrition   => 0,
        },
        'flesh golem' => {
            weight      => 1400,
            nutrition   => 600,
            cold        => '12%',
            fire        => '12%',
            poison      => '12%',
            shock       => '12%',
            sleep       => '12%',
        },
        'floating eye' => {
            weight      => 10,
            nutrition   => 10,
            telepathy   => '100%',
        },
        'fog cloud' => {
            weight      => 0,
            nutrition   => 0,
            vegetarian  => 1,
            vegan       => 1,
        },
        'forest centaur' => {
            weight      => 2550,
            nutrition   => 600,
        },
        'fox' => {
            weight      => 300,
            nutrition   => 250,
        },
        'freezing sphere' => {
            weight      => 10,
            nutrition   => 0,
        },
        'frost giant' => {
            weight      => 2250,
            nutrition   => 750,
            cold        => '33%',
            strength    => '100%',
        },
        'gargoyle' => {
            has_egg     => 1,
            weight      => 1000,
            nutrition   => 200,
        },
        'garter snake' => {
            has_egg     => 1,
            weight      => 50,
            nutrition   => 60,
        },
        'gas spore' => {
            weight      => 10,
            nutrition   => 0,
        },
        'gecko' => {
            weight      => 10,
            nutrition   => 20,
        },
        'gelatinous cube' => {
            weight      => 600,
            nutrition   => 150,
            acidic      => '100%',
            cold        => '10%',
            fire        => '10%',
            shock       => '10%',
            sleep       => '10%',
            vegetarian  => 1,
            vegan       => 1,
        },
        'ghost' => {
            weight      => 1450,
            nutrition   => 0,
            vegetarian  => 1,
            vegan       => 1,
        },
        'ghoul' => {
            weight      => 400,
            nutrition   => 0,
        },
        'giant' => {
            weight      => 2250,
            nutrition   => 750,
            strength    => '100%',
        },
        'giant ant' => {
            has_egg     => 1,
            weight      => 10,
            nutrition   => 10,
        },
        'giant bat' => {
            weight      => 30,
            nutrition   => 30,
            stun   => '60',
        },
        'giant beetle' => {
            weight      => 10,
            nutrition   => 10,
            poison      => '33%',
            poisonous   => '100%',
        },
        'giant eel' => {
            has_egg     => 1,
            weight      => 200,
            nutrition   => 250,
        },
        'giant mimic' => {
            weight      => 800,
            nutrition   => 500,
            mimic   => '50',
        },
        'giant mummy' => {
            weight      => 2050,
            nutrition   => 375,
        },
        'giant rat' => {
            weight      => 30,
            nutrition   => 30,
        },
        'giant spider' => {
            has_egg     => 1,
            weight      => 100,
            nutrition   => 100,
            poison      => '33%',
            poisonous   => '100%',
        },
        'giant zombie' => {
            weight      => 2050,
            nutrition   => 375,
        },
        'glass golem' => {
            weight      => 1800,
            nutrition   => 0,
            vegetarian  => 1,
            vegan       => 1,
        },
        'glass piercer' => {
            weight      => 400,
            nutrition   => 300,
        },
        'gnome' => {
            cannibal    => "Gno",
            weight      => 650,
            nutrition   => 100,
        },
        'gnome king' => {
            cannibal    => "Gno",
            weight      => 750,
            nutrition   => 150,
        },
        'gnome lord' => {
            cannibal    => "Gno",
            weight      => 700,
            nutrition   => 120,
        },
        'gnome mummy' => {
            weight      => 650,
            nutrition   => 50,
        },
        'gnome zombie' => {
            weight      => 650,
            nutrition   => 50,
        },
        'gnomish wizard' => {
            cannibal    => "Gno",
            weight      => 700,
            nutrition   => 120,
        },
        'goblin' => {
            weight      => 400,
            nutrition   => 100,
        },
        'gold golem' => {
            weight      => 450,
            nutrition   => 0,
            vegetarian  => 1,
            vegan       => 1,
        },
        'golden naga' => {
            has_egg     => 1,
            weight      => 2600,
            nutrition   => 400,
            poison      => '67%',
        },
        'golden naga hatchling' => {
            weight      => 500,
            nutrition   => 100,
            poison      => '20%',
        },
        'gray dragon' => {
            has_egg     => 1,
            weight      => 4500,
            nutrition   => 1500,
        },
        'gray ooze' => {
            weight      => 500,
            nutrition   => 250,
            acidic      => '100%',
            cold        => '7%',
            fire        => '7%',
            poison      => '7%',
            vegetarian  => 1,
        },
        'gray unicorn' => {
            weight      => 1300,
            nutrition   => 300,
            poison      => '27%',
        },
        'green dragon' => {
            has_egg     => 1,
            weight      => 4500,
            nutrition   => 1500,
            poison      => '100%',
            poisonous   => '100%',
        },
        'green mold' => {
            weight      => 50,
            nutrition   => 30,
            acidic      => '100%',
            vegetarian  => 1,
            vegan       => 1,
        },
        'green slime' => {
            weight      => 400,
            nutrition   => 150,
            acidic      => '100%',
            poisonous   => '100%',
            slime       => '100%',
            vegetarian  => 1,
        },
        'gremlin' => {
            weight      => 100,
            nutrition   => 20,
            poison      => '33%',
            poisonous   => '100%',
        },
        'grid bug' => {
            weight      => 15,
            nutrition   => 0,
        },
        'guard' => {
            cannibal    => "Hum",
            weight      => 1450,
            nutrition   => 400,
        },
        'guardian naga' => {
            has_egg     => 1,
            weight      => 2600,
            nutrition   => 400,
            poison      => '80%',
            poisonous   => '100%',
        },
        'guardian naga hatchling' => {
            weight      => 500,
            nutrition   => 100,
            poison      => '20%',
        },
        'guide' => {
            cannibal    => "Hum",
            weight      => 1450,
            nutrition   => 400,
        },
        'healer' => {
            cannibal    => "Hum",
            weight      => 1450,
            nutrition   => 400,
        },
        'hell hound' => {
            weight      => 600,
            nutrition   => 300,
            fire        => '80%',
        },
        'hell hound pup' => {
            weight      => 200,
            nutrition   => 200,
            fire        => '47%',
        },
        'hezrou' => {
            weight      => 1450,
            nutrition   => 0,
        },
        'high priest' => {
            cannibal    => "Hum",
            weight      => 1450,
            nutrition   => 400,
        },
        'hill giant' => {
            weight      => 2200,
            nutrition   => 700,
            strength    => '100%',
        },
        'hill orc' => {
            weight      => 1000,
            nutrition   => 200,
        },
        'hobbit' => {
            weight      => 500,
            nutrition   => 200,
        },
        'hobgoblin' => {
            weight      => 1000,
            nutrition   => 200,
        },
        'homunculus' => {
            weight      => 60,
            nutrition   => 100,
            poison      => '7%',
            poisonous   => '100%',
            sleep       => '7%',
        },
        'horned devil' => {
            weight      => 1450,
            nutrition   => 0,
        },
        'horse' => {
            weight      => 1500,
            nutrition   => 300,
        },
        'housecat' => {
            weight      => 200,
            nutrition   => 200,
            aggravate   => '100%',
        },
        'human' => {
            cannibal    => "Hum",
            weight      => 1450,
            nutrition   => 400,
        },
        'human mummy' => {
            weight      => 1450,
            nutrition   => 200,
        },
        'human zombie' => {
            weight      => 1450,
            nutrition   => 200,
        },
        'hunter' => {
            cannibal    => "Hum",
            weight      => 1450,
            nutrition   => 400,
        },
        'ice devil' => {
            weight      => 1450,
            nutrition   => 0,
        },
        'ice troll' => {
            weight      => 1000,
            nutrition   => 300,
            cold        => '60%',
        },
        'ice vortex' => {
            weight      => 0,
            nutrition   => 0,
            vegetarian  => 1,
            vegan       => 1,
        },
        'iguana' => {
            weight      => 30,
            nutrition   => 30,
        },
        'imp' => {
            weight      => 20,
            nutrition   => 10,
        },
        'incubus' => {
            weight      => 1450,
            nutrition   => 0,
        },
        'iron golem' => {
            weight      => 2000,
            nutrition   => 0,
            vegetarian  => 1,
            vegan       => 1,
        },
        'iron piercer' => {
            weight      => 400,
            nutrition   => 300,
        },
        'jabberwock' => {
            weight      => 1300,
            nutrition   => 600,
        },
        'jackal' => {
            weight      => 300,
            nutrition   => 250,
        },
        'jaguar' => {
            weight      => 600,
            nutrition   => 300,
        },
        'jellyfish' => {
            weight      => 80,
            nutrition   => 20,
            poison      => '20%',
            poisonous   => '100%',
        },
        'ki-rin' => {
            weight      => 1450,
            nutrition   => 0,
        },
        'killer bee' => {
            has_egg     => 1,
            weight      => 1,
            nutrition   => 5,
            poison      => '30%',
            poisonous   => '100%',
        },
        'kitten' => {
            weight      => 150,
            nutrition   => 150,
            aggravate   => '100%',
        },
        'knight' => {
            cannibal    => "Hum",
            weight      => 1450,
            nutrition   => 400,
        },
        'kobold' => {
            weight      => 400,
            nutrition   => 100,
            poisonous   => '100%',
        },
        'kobold lord' => {
            weight      => 500,
            nutrition   => 200,
            poisonous   => '100%',
        },
        'kobold mummy' => {
            weight      => 400,
            nutrition   => 50,
        },
        'kobold shaman' => {
            weight      => 450,
            nutrition   => 150,
            poisonous   => '100%',
        },
        'kobold zombie' => {
            weight      => 400,
            nutrition   => 50,
        },
        'kraken' => {
            weight      => 1800,
            nutrition   => 1000,
        },
        'large cat' => {
            weight      => 250,
            nutrition   => 250,
            aggravate   => '100%',
        },
        'large dog' => {
            weight      => 800,
            nutrition   => 250,
            aggravate   => '100%',
        },
        'large kobold' => {
            weight      => 450,
            nutrition   => 150,
            poisonous   => '100%',
        },
        'large mimic' => {
            weight      => 600,
            nutrition   => 400,
            mimic   => '40',
        },
        'leather golem' => {
            weight      => 800,
            nutrition   => 0,
        },
        'lemure' => {
            weight      => 150,
            nutrition   => 0,
        },
        'leocrotta' => {
            weight      => 1200,
            nutrition   => 500,
        },
        'leprechaun' => {
            weight      => 60,
            nutrition   => 30,
            teleportitis   => '50%',
        },
        'lich' => {
            weight      => 1200,
            nutrition   => 0,
        },
        'lichen' => {
            weight      => 20,
            nutrition   => 200,
            vegetarian  => 1,
            vegan       => 1,
        },
        'lieutenant' => {
            cannibal    => "Hum",
            weight      => 1450,
            nutrition   => 400,
        },
        'little dog' => {
            weight      => 150,
            nutrition   => 150,
            aggravate   => '100%',
        },
        'lizard' => {
            weight      => 10,
            nutrition   => 40,
            confusion   => '100%',
            'cure stoning' => '100%',
            'reduce stunning' => '100%',
        },
        'long worm' => {
            has_egg     => 1,
            weight      => 1500,
            nutrition   => 500,
        },
        'lurker above' => {
            weight      => 800,
            nutrition   => 350,
        },
        'lynx' => {
            weight      => 600,
            nutrition   => 300,
        },
        'manes' => {
            weight      => 100,
            nutrition   => 0,
        },
        'marilith' => {
            weight      => 1450,
            nutrition   => 0,
        },
        'master lich' => {
            weight      => 1200,
            nutrition   => 0,
        },
        'master mind flayer' => {
            weight      => 1450,
            nutrition   => 400,
            'int gain / telepathy' => '100%',
            intelligence   => '50%',
        },
        'mastodon' => {
            weight      => 3800,
            nutrition   => 800,
        },
        'mind flayer' => {
            weight      => 1450,
            nutrition   => 400,
            'int gain / telepathy' => '100%',
            intelligence   => '50%',
        },
        'minotaur' => {
            weight      => 1500,
            nutrition   => 700,
        },
        'monk' => {
            cannibal    => "Hum",
            weight      => 1450,
            nutrition   => 400,
        },
        'monkey' => {
            weight      => 100,
            nutrition   => 50,
        },
        'mountain centaur' => {
            weight      => 2550,
            nutrition   => 500,
        },
        'mountain nymph' => {
            weight      => 600,
            nutrition   => 300,
            teleportitis   => '30%',
        },
        'mumak' => {
            weight      => 2500,
            nutrition   => 500,
        },
        'nalfeshnee' => {
            weight      => 1450,
            nutrition   => 0,
        },
        'neanderthal' => {
            cannibal    => "Hum",
            weight      => 1450,
            nutrition   => 400,
        },
        'newt' => {
            weight      => 10,
            nutrition   => 20,
            energy   => '67%',
        },
        'ninja' => {
            cannibal    => "Hum",
            weight      => 1450,
            nutrition   => 400,
        },
        'nurse' => {
            cannibal    => "Hum",
            weight      => 1450,
            nutrition   => 400,
            heal   => '100%',
            poison      => '73%',
        },
        'ochre jelly' => {
            weight      => 50,
            nutrition   => 20,
            acidic      => '100%',
            vegetarian  => 1,
            vegan       => 1,
        },
        'ogre' => {
            weight      => 1600,
            nutrition   => 500,
        },
        'ogre king' => {
            weight      => 1700,
            nutrition   => 750,
        },
        'ogre lord' => {
            weight      => 1700,
            nutrition   => 700,
        },
        'orange dragon' => {
            has_egg     => 1,
            weight      => 4500,
            nutrition   => 1500,
            sleep       => '100%',
        },
        'orc' => {
            weight      => 850,
            nutrition   => 150,
        },
        'orc mummy' => {
            weight      => 850,
            nutrition   => 75,
        },
        'orc shaman' => {
            weight      => 1000,
            nutrition   => 300,
        },
        'orc zombie' => {
            weight      => 850,
            nutrition   => 75,
        },
        'orc-captain' => {
            weight      => 1350,
            nutrition   => 350,
        },
        'owlbear' => {
            weight      => 1700,
            nutrition   => 700,
        },
        'page' => {
            cannibal    => "Hum",
            weight      => 1450,
            nutrition   => 400,
        },
        'panther' => {
            weight      => 600,
            nutrition   => 300,
        },
        'paper golem' => {
            weight      => 400,
            nutrition   => 0,
        },
        'piranha' => {
            has_egg     => 1,
            weight      => 60,
            nutrition   => 30,
        },
        'pit fiend' => {
            weight      => 1450,
            nutrition   => 0,
        },
        'pit viper' => {
            has_egg     => 1,
            weight      => 100,
            nutrition   => 60,
            poison      => '40%',
            poisonous   => '100%',
        },
        'plains centaur' => {
            weight      => 2500,
            nutrition   => 500,
        },
        'pony' => {
            weight      => 1300,
            nutrition   => 250,
        },
        'priest' => {
            cannibal    => "Hum",
            weight      => 1450,
            nutrition   => 400,
        },
        'priestess' => {
            cannibal    => "Hum",
            weight      => 1450,
            nutrition   => 400,
        },
        'prisoner' => {
            cannibal    => "Hum",
            weight      => 1450,
            nutrition   => 400,
        },
        'purple worm' => {
            has_egg     => 1,
            weight      => 2700,
            nutrition   => 700,
        },
        'pyrolisk' => {
            has_egg     => 1,
            weight      => 30,
            nutrition   => 30,
            fire        => '20%',
            poison      => '20%',
        },
        'python' => {
            has_egg     => 1,
            weight      => 250,
            nutrition   => 100,
        },
        'quantum mechanic' => {
            weight      => 1450,
            nutrition   => 20,
            poisonous   => '100%',
            'speed toggle' => '100%',
        },
        'quasit' => {
            weight      => 200,
            nutrition   => 200,
            poison      => '20%',
        },
        'queen bee' => {
            weight      => 1,
            nutrition   => 5,
            poison      => '60%',
            poisonous   => '100%',
        },
        'quivering blob' => {
            weight      => 200,
            nutrition   => 100,
            poison      => '33%',
            vegetarian  => 1,
            vegan       => 1,
        },
        'rabid rat' => {
            weight      => 30,
            nutrition   => 5,
            poisonous   => '100%',
        },
        'ranger' => {
            cannibal    => "Hum",
            weight      => 1450,
            nutrition   => 400,
        },
        'raven' => {
            weight      => 40,
            nutrition   => 20,
        },
        'red dragon' => {
            has_egg     => 1,
            weight      => 4500,
            nutrition   => 1500,
            fire        => '100%',
        },
        'red mold' => {
            weight      => 50,
            nutrition   => 30,
            fire        => '3%',
            poison      => '3%',
            vegetarian  => 1,
            vegan       => 1,
        },
        'red naga' => {
            has_egg     => 1,
            weight      => 2600,
            nutrition   => 400,
            fire        => '20%',
            poison      => '20%',
        },
        'red naga hatchling' => {
            weight      => 500,
            nutrition   => 100,
            fire        => '10%',
            poison      => '10%',
        },
        'rock mole' => {
            weight      => 30,
            nutrition   => 30,
        },
        'rock piercer' => {
            weight      => 200,
            nutrition   => 200,
        },
        'rock troll' => {
            weight      => 1200,
            nutrition   => 300,
        },
        'rogue' => {
            cannibal    => "Hum",
            weight      => 1450,
            nutrition   => 400,
        },
        'rope golem' => {
            weight      => 450,
            nutrition   => 0,
        },
        'roshi' => {
            cannibal    => "Hum",
            weight      => 1450,
            nutrition   => 400,
        },
        'rothe' => {
            weight      => 400,
            nutrition   => 100,
        },
        'rust monster' => {
            weight      => 1000,
            nutrition   => 250,
        },
        'salamander' => {
            weight      => 1500,
            nutrition   => 400,
            fire        => '53%',
            poisonous   => '100%',
        },
        'samurai' => {
            cannibal    => "Hum",
            weight      => 1450,
            nutrition   => 400,
        },
        'sandestin' => {
            weight      => 1500,
            nutrition   => 0,
        },
        'sasquatch' => {
            weight      => 1550,
            nutrition   => 750,
        },
        'scorpion' => {
            has_egg     => 1,
            weight      => 50,
            nutrition   => 100,
            poison      => '50%',
            poisonous   => '100%',
        },
        'sergeant' => {
            cannibal    => "Hum",
            weight      => 1450,
            nutrition   => 400,
        },
        'sewer rat' => {
            weight      => 20,
            nutrition   => 12,
        },
        'shade' => {
            weight      => 1450,
            nutrition   => 0,
        },
        'shark' => {
            has_egg     => 1,
            weight      => 500,
            nutrition   => 350,
        },
        'shocking sphere' => {
            weight      => 10,
            nutrition   => 0,
        },
        'shopkeeper' => {
            cannibal    => "Hum",
            weight      => 1450,
            nutrition   => 400,
        },
        'shrieker' => {
            weight      => 100,
            nutrition   => 100,
            poison      => '20%',
            vegetarian  => 1,
            vegan       => 1,
        },
        'silver dragon' => {
            has_egg     => 1,
            weight      => 4500,
            nutrition   => 1500,
        },
        'skeleton' => {
            weight      => 300,
            nutrition   => 0,
        },
        'small mimic' => {
            weight      => 300,
            nutrition   => 200,
            mimic   => '20',
        },
        'snake' => {
            has_egg     => 1,
            weight      => 100,
            nutrition   => 80,
            poison      => '27%',
            poisonous   => '100%',
        },
        'soldier' => {
            cannibal    => "Hum",
            weight      => 1450,
            nutrition   => 400,
        },
        'soldier ant' => {
            has_egg     => 1,
            weight      => 20,
            nutrition   => 5,
            poison      => '20%',
            poisonous   => '100%',
        },
        'spotted jelly' => {
            weight      => 50,
            nutrition   => 20,
            acidic      => '100%',
            vegetarian  => 1,
            vegan       => 1,
        },
        'stalker' => {
            weight      => 900,
            nutrition   => 400,
            invisibility   => '100%',
            stun   => '60',
        },
        'steam vortex' => {
            weight      => 0,
            nutrition   => 0,
            vegetarian  => 1,
            vegan       => 1,
        },
        'stone giant' => {
            weight      => 2250,
            nutrition   => 750,
            strength    => '100%',
        },
        'stone golem' => {
            weight      => 1900,
            nutrition   => 0,
        },
        'storm giant' => {
            weight      => 2250,
            nutrition   => 750,
            shock       => '50%',
            strength    => '100%',
        },
        'straw golem' => {
            weight      => 400,
            nutrition   => 0,
        },
        'student' => {
            cannibal    => "Hum",
            weight      => 1450,
            nutrition   => 400,
        },
        'succubus' => {
            weight      => 1450,
            nutrition   => 0,
        },
        'tengu' => {
            weight      => 300,
            nutrition   => 200,
            poison      => '13%',
            'teleport control' => '17%',
            teleportitis   => '20%',
        },
        'thug' => {
            cannibal    => "Hum",
            weight      => 1450,
            nutrition   => 400,
        },
        'tiger' => {
            weight      => 600,
            nutrition   => 300,
        },
        'titan' => {
            weight      => 2300,
            nutrition   => 900,
        },
        'titanothere' => {
            weight      => 2650,
            nutrition   => 650,
        },
        'tourist' => {
            cannibal    => "Hum",
            weight      => 1450,
            nutrition   => 400,
        },
        'trapper' => {
            weight      => 800,
            nutrition   => 350,
        },
        'troll' => {
            weight      => 800,
            nutrition   => 350,
        },
        'umber hulk' => {
            weight      => 1200,
            nutrition   => 500,
        },
        'valkyrie' => {
            cannibal    => "Hum",
            weight      => 1450,
            nutrition   => 400,
        },
        'vampire' => {
            weight      => 1450,
            nutrition   => 400,
        },
        'vampire bat' => {
            weight      => 30,
            nutrition   => 20,
            poisonous   => '100%',
        },
        'vampire lord' => {
            weight      => 1450,
            nutrition   => 400,
        },
        'violet fungus' => {
            weight        => 100,
            nutrition     => 100,
            hallucination => '100%',
            poison        => '20%',
            vegetarian    => 1,
            vegan         => 1,
        },
        'vrock' => {
            weight      => 1450,
            nutrition   => 0,
        },
        'warg' => {
            weight      => 850,
            nutrition   => 350,
        },
        'warhorse' => {
            weight      => 1800,
            nutrition   => 350,
        },
        'warrior' => {
            cannibal    => "Hum",
            weight      => 1450,
            nutrition   => 400,
        },
        'watch captain' => {
            cannibal    => "Hum",
            weight      => 1450,
            nutrition   => 400,
        },
        'watchman' => {
            cannibal    => "Hum",
            weight      => 1450,
            nutrition   => 400,
        },
        'water demon' => {
            weight      => 1450,
            nutrition   => 0,
        },
        'water elemental' => {
            weight      => 2500,
            nutrition   => 0,
            vegetarian  => 1,
            vegan       => 1,
        },
        'water moccasin' => {
            has_egg     => 1,
            weight      => 150,
            nutrition   => 80,
            poison      => '27%',
            poisonous   => '100%',
        },
        'water nymph' => {
            weight      => 600,
            nutrition   => 300,
            teleportitis   => '30%',
        },
        'water troll' => {
            weight      => 1200,
            nutrition   => 350,
        },
        'werejackal' => {
            cannibal    => "Hum",
            weight      => 1450,
            nutrition   => 400,
            lycanthropy => '100%',
            poisonous   => '100%',
        },
        'wererat' => {
            cannibal    => "Hum",
            weight      => 1450,
            nutrition   => 400,
            lycanthropy => '100%',
            poisonous   => '100%',
        },
        'werewolf' => {
            cannibal    => "Hum",
            weight      => 1450,
            nutrition   => 400,
            lycanthropy => '100%',
            poisonous   => '100%',
        },
        'white dragon' => {
            has_egg     => 1,
            weight      => 4500,
            nutrition   => 1500,
            cold        => '100%',
        },
        'white unicorn' => {
            weight      => 1300,
            nutrition   => 300,
            poison      => '27%',
        },
        'winged gargoyle' => {
            weight      => 1200,
            nutrition   => 300,
        },
        'winter wolf' => {
            weight      => 700,
            nutrition   => 300,
            cold        => '47%',
        },
        'winter wolf cub' => {
            weight      => 250,
            nutrition   => 200,
            cold        => '33%',
        },
        'wizard' => {
            cannibal    => "Hum",
            weight      => 1450,
            nutrition   => 400,
        },
        'wolf' => {
            weight      => 500,
            nutrition   => 250,
        },
        'wood golem' => {
            weight      => 900,
            nutrition   => 0,
        },
        'wood nymph' => {
            weight      => 600,
            nutrition   => 300,
            teleportitis   => '30%',
        },
        'woodchuck' => {
            weight      => 30,
            nutrition   => 30,
        },
        'wraith' => {
            weight      => 0,
            nutrition   => 0,
            'gain level' => '100%',
        },
        'wumpus' => {
            weight      => 2500,
            nutrition   => 500,
        },
        'xan' => {
            weight      => 300,
            nutrition   => 300,
            poison      => '47%',
            poisonous   => '100%',
        },
        'xorn' => {
            weight      => 1200,
            nutrition   => 700,
        },
        'yellow dragon' => {
            has_egg     => 1,
            weight      => 4500,
            nutrition   => 1500,
            acidic      => '100%',
        },
        'yellow light' => {
            weight      => 0,
            nutrition   => 0,
            vegetarian  => 1,
            vegan       => 1,
        },
        'yellow mold' => {
            weight        => 50,
            nutrition     => 30,
            hallucination => '100%',
            poison        => '7%',
            poisonous     => '100%',
            vegetarian    => 1,
            vegan         => 1,
        },
        'yeti' => {
            weight      => 1600,
            nutrition   => 700,
            cold        => '33%',
        },
        'zruty' => {
            weight      => 1200,
            nutrition   => 600,
        },
    );

    # Collect monster corpses, tins, and eggs
    for my $name (keys %monsterlist) {
        my $stats = $monsterlist{$name};
        $food->{"$name corpse"}          = $stats;
        $food->{"$name corpse"}{corpse}  = 1;
        $food->{"$name corpse"}{subtype} = 'corpse';
        $food->{"$name corpse"}{plural}  = "$name corpses";

        my $tin_name = $name;
        $tin_name .= " meat"
            unless $stats->{vegetarian};
        $food->{"tin of $tin_name"} = {
            appearance => "tin",
            plural     => "tins of $tin_name",
        };

        if ($stats->{has_egg}) {
            $food->{"$name egg"} = {
                price      => 9,
                weight     => 1,
                nutrition  => 80,
                time       => 1,
                unsafe     => 1,
                appearance => "egg",
                plural     => "$name eggs",
            };
        }
    }

    return $food;
}

sub extra_plurals {
    return {
        tin => 'tins',
    };
}

1;

