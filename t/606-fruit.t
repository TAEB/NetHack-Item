#!/usr/bin/env perl
use lib 't/lib';
use Test::NetHack::Item;
use Test::Fatal;

my $slime_pool = NetHack::ItemPool->new;
my $slime_mold = $slime_pool->new_item("a slime mold");
is($slime_mold->nutrition, 250);
ok($slime_mold->is_custom_fruit, "slime mold is custom fruit");
is($slime_mold->appearance, 'slime mold');
is($slime_mold->identity, 'slime mold');

my $molds = $slime_pool->new_item("3 slime molds");
is($molds->nutrition, 250);
ok($molds->is_custom_fruit, "slime molds is custom fruit");
is($molds->appearance, 'slime mold');
is($molds->identity, 'slime mold');

like(
    exception { $slime_pool->new_item("a server") },
    qr/^Unknown item type for 'server' from a server/,
    "we don't accept any random fruit type"
);


my $brain_pool = NetHack::ItemPool->new(
    fruit_name => "brain",
    fruit_plural => "brains",
);
my $brain = $brain_pool->new_item("a brain");
is($brain->nutrition, 250);
ok($brain->is_custom_fruit, "brain is custom fruit");
is($brain->appearance, 'brain');
is($brain->identity, 'slime mold');

my $brains = $brain_pool->new_item("3 brains");
is($brains->nutrition, 250);
ok($brains->is_custom_fruit, "brains is custom fruit");
is($brains->appearance, 'brain');
is($brains->identity, 'slime mold');


my $child_pool = NetHack::ItemPool->new(
    fruit_name => "child",
    fruit_plural => "children",
);
my $child = $child_pool->new_item("a child");
is($child->nutrition, 250);
ok($child->is_custom_fruit, "child is custom fruit");
is($child->appearance, 'child');
is($child->identity, 'slime mold');

my $children = $child_pool->new_item("3 children");
is($children->nutrition, 250);
ok($children->is_custom_fruit, "children is custom fruit");
is($children->appearance, 'child');
is($children->identity, 'slime mold');


my $any_pool = NetHack::ItemPool->new(
    allow_other_fruit_names => 1,
);

my $server = $any_pool->new_item("a server");
is($server->nutrition, 250);
ok($server->is_custom_fruit, "server is custom fruit");
is($server->appearance, 'server');
is($server->identity, 'slime mold');

my $servers = $any_pool->new_item("3 servers");
is($servers->nutrition, 250);
ok($servers->is_custom_fruit, "servers is custom fruit");
{ local $TODO = "we don't singularize properly yet";
is($servers->appearance, 'server');
}
is($servers->identity, 'slime mold');

my $any_slime_mold = $any_pool->new_item("a slime mold");
is($any_slime_mold->nutrition, 250);
ok($any_slime_mold->is_custom_fruit, "slime mold is custom fruit");
is($any_slime_mold->appearance, 'slime mold');
is($any_slime_mold->identity, 'slime mold');

my $any_molds = $any_pool->new_item("3 slime molds");
is($any_molds->nutrition, 250);
ok($any_molds->is_custom_fruit, "slime molds is custom fruit");
is($any_molds->appearance, 'slime mold');
is($any_molds->identity, 'slime mold');

done_testing;
