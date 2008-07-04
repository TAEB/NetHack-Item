use inc::Module::Install;

name     'NetHack-Item';
all_from 'lib/NetHack/Item.pm';

requires 'Moose';
requires 'List::Util';

build_requires 'Test::More';
build_requires 'Test::Exception';

WriteAll;

