#!/usr/bin/env perl
use strict;
use warnings;
use Test::More tests => 4;
use Devel::StackTrace::WithLexicals;

my $stack = Devel::StackTrace::WithLexicals->new;
is($stack->frame_count, 1);

my $frame = $stack->frame(0);
is_deeply($frame->lexicals, {});

# now another stack trace, this time with lexicals!
my $stack2 = Devel::StackTrace::WithLexicals->new;
is($stack2->frame_count, 1);

my $frame2 = $stack2->frame(0);
is_deeply($frame2->lexicals, {
    '$stack' => \$stack,
    '$frame' => \$frame,
});

