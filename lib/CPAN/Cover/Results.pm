package CPAN::Cover::Results;

# ABSTRACT:

use CPAN::Cover::Results::ReleaseIterator;

use Moo;
with 'MooX::Role::CachedURL'
    # => { -version => 0.03 }
    ;

has '+url' =>
    (
        default => sub { 'http://cpancover.com/staging/cpancover.json' },
    );

sub release_iterator
{
    my $self = shift;

    return CPAN::Cover::Results::ReleaseIterator->new( results => $self );
}

1;

=head1 NAME

CPAN::Cover::Results - get CPAN coverage test results from CPAN Cover service

=head1 SYNOPSIS

 use CPAN::Cover::Results;

 my $iterator = CPAN::Cover::Results->new()->iterator();

 while (my $dist = $iterator->next) {
     printf "%s (%s) : %.2f\n", $dist->name, $dist->version, $dist->total;
 }

=head1 DESCRIPTION

This module will get the coverage test results from the CPAN Cover service
and let you iterate over them, distribution by distribution.

