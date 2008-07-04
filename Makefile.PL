use inc::Module::Install;

name     'NetHack-Item';
all_from 'lib/NetHack/Item.pm';

requires 'Moose' => '0.54';
requires 'MooseX::AttributeHelpers' => '0.12';
requires 'Module::Pluggable';

build_requires 'Test::More';
build_requires 'Test::Exception';

WriteAll;

