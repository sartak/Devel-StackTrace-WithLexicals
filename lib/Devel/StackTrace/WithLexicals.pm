#!/usr/bin/env perl
package Devel::StackTrace::WithLexicals;
use strict;
use warnings;
use base 'Devel::StackTrace';

use PadWalker 'peek_my';

our $VERSION = '0.01';

sub _record_caller_data {
    my $self = shift;

    $self->SUPER::_record_caller_data(@_);

    my $caller = -1;
    my $walker = 0;

    while (my (undef, undef, undef, $sub) = caller(++$caller)) {
        next if $sub eq '(eval)';

        $self->{raw}[$caller]{lexicals} = peek_my(++$walker);
    }

    # don't want to include the frame for this method!
    shift @{ $self->{raw} };
}

1;

__END__

=head1 NAME

Devel::StackTrace::WithLexicals - ???

=head1 SYNOPSIS

    use Devel::StackTrace::WithLexicals;

=head1 DESCRIPTION



=head1 AUTHOR

Shawn M Moore, C<< <sartak@gmail.com> >>

=head1 BUGS

No known bugs.

Please report any bugs through RT: email
C<bug-devel-stacktrace-withlexicals at rt.cpan.org>, or browse
L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Devel-StackTrace-WithLexicals>.

=head1 COPYRIGHT AND LICENSE

Copyright 2008 Shawn M Moore.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

