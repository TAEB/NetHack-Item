use inc::Module::Install;

name     'NetHack-Item';
all_from 'lib/NetHack/Item.pm';

requires 'Moose';

build_requires 'Test::More';

WriteAll;

