#!/usr/bin/env perl
use strict;
use warnings;
use Test::More tests => 6;
use NetHack::Item;

my $elven_dagger = NetHack::Item->new("an elven dagger");
ok(!$elven_dagger->is_artifact, "not an artifact yet");

$elven_dagger->specific_name("Sorear");
ok(!$elven_dagger->is_artifact, "not an artifact yet");

$elven_dagger->specific_name("Sting");
ok($elven_dagger->is_artifact, "naming an elven dagger Sting makes it an artifact");

my $elven_broadsword = NetHack::Item->new("an elven broadsword");
ok(!$elven_broadsword->is_artifact, "not an artifact yet");

$elven_broadsword->specific_name("Arcanehl");
ok(!$elven_broadsword->is_artifact, "not an artifact yet");

$elven_broadsword->specific_name("Orcrist");
ok($elven_broadsword->is_artifact, "naming an elven broadsword Orcrist makes it an artifact");

