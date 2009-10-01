# Load the Module::Install bundled in ./inc/
use inc::Module::Install;

# Define metadata
name     'NetHack-Item';
all_from 'lib/NetHack/Item.pm';
githubmeta;

requires 'NetHack::Monster::Spoiler'   => 0.02;
requires 'Moose'                       => 0.90;
requires 'MooseX::Role::Parameterized' => 0.05;
requires 'Module::Pluggable'           => 3.8;
requires 'Set::Object'                 => 1.00;
requires 'Test::More'                  => 0.86;
requires 'Test::Exception'             => 0.27;

WriteAll;

