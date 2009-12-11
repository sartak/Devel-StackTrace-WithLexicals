#!/usr/bin/env perl
use strict;
use warnings;
use Test::More tests => 7;
use Devel::StackTrace::WithLexicals;

my $stack = Devel::StackTrace::WithLexicals->new(no_refs => 1);
is($stack->frame_count, 1);

my $frame = $stack->frame(0);
is_deeply($frame->lexicals, {});

my $stack2 = Devel::StackTrace::WithLexicals->new(no_refs => 1);
is($stack2->frame_count, 1);

my $frame2 = $stack2->frame(0);
is(ref($frame2->lexicals->{'$stack'}), '');
is(ref($frame2->lexicals->{'$frame'}), '');
like($frame2->lexicals->{'$stack'}, qr/^Devel::StackTrace::WithLexicals=HASH\(0x\w+\)$/);
like($frame2->lexicals->{'$frame'}, qr/^Devel::StackTrace::WithLexicals::Frame=HASH\(0x\w+\)$/);

