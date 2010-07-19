use inc::Module::Install;

name     'Devel-StackTrace-WithLexicals';
all_from 'lib/Devel/StackTrace/WithLexicals.pm';
githubmeta;

requires 'Devel::StackTrace' => '1.22';
requires 'PadWalker' => '1.92';

WriteAll;

