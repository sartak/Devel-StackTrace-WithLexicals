#!/usr/bin/env perl
use strict;
use warnings;
use Test::More tests => 1;

my $ok = 0;

do {
    package Synopsis;
    sub oh_god_why { $ok = 1 }
};

my $self = bless {}, 'Synopsis';

sub {
    use Devel::StackTrace::WithLexicals;
    my $trace = Devel::StackTrace::WithLexicals->new;
    ${ $trace->frame(0)->lexicals->{'$self'} }->oh_god_why();
}->();

ok($ok, "oh_god_why called");

