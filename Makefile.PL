use inc::Module::Install;

name     'NetHack-Item';
all_from 'lib/NetHack/Item.pm';

build_requires 'Test::More';

WriteAll;

