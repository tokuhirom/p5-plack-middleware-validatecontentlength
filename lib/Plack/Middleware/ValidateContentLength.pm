package Plack::Middleware::ValidateContentLength;
use strict;
use warnings;
use parent qw/Plack::Middleware/;
use 5.00800;
our $VERSION = '0.02';
use Plack::Util qw//;

sub call {
    my ( $self, $env ) = @_;

    my $res = $self->app->($env);

    my $header_length = Plack::Util::header_get($res->[1], 'Content-Length');
    if ($header_length) {
        my $body_length = Plack::Util::content_length($res->[2]);
        if ($header_length != $body_length) {
            print STDERR "INVALID CONTENT LENGTH: header: $header_length, body: $body_length, $env->{PATH_INFO}\n";
            return [500, [], ['Content Length Error']];
        }
    }

    return $res;
}


1;
__END__

=encoding utf8

=head1 NAME

Plack::Middleware::ValidateContentLength -

=head1 SYNOPSIS

    plackup -e 'enable "ValidateContentLength"' -e '[200, ["Content-Length" => 3], ["NOT OK"]]'

=head1 DESCRIPTION

Plack::Middleware::ValidateContentLength is

=head1 AUTHOR

Tokuhiro Matsuno E<lt>tokuhirom AAJKLFJEF GMAIL COME<gt>

=head1 SEE ALSO

=head1 LICENSE

Copyright (C) Tokuhiro Matsuno

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
