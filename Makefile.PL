use inc::Module::Install;

name     'Devel-StackTrace-WithLexicals';
all_from 'lib/Devel/StackTrace/WithLexicals.pm';

requires 'Devel::StackTrace' => '1.1902';
requires 'PadWalker';

build_requires 'Test::More';

WriteAll;

