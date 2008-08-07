use inc::Module::Install;

name     'Devel-StackTrace-WithLexicals';
all_from 'lib/Devel/StackTrace/WithLexicals.pm';

build_requires 'Test::More';

WriteAll;

