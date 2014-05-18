package CPAN::Cover::Results::Release;

use Moo;

has 'distname'   => ( is => 'ro' );
has 'version'    => ( is => 'ro' );
has 'branch'     => ( is => 'ro' );
has 'condition'  => ( is => 'ro' );
has 'pod'        => ( is => 'ro' );
has 'statement'  => ( is => 'ro' );
has 'subroutine' => ( is => 'ro' );
has 'total'      => ( is => 'ro' );

1;
