package CPAN::Cover::Results::Distribution;

use Moo;

has 'name'       => ( is => 'ro' );
has 'version'    => ( is => 'ro' );
has 'branch'     => ( is => 'ro' );
has 'condition'  => ( is => 'ro' );
has 'pod'        => ( is => 'ro' );
has 'statement'  => ( is => 'ro' );
has 'subroutine' => ( is => 'ro' );
has 'total'      => ( is => 'ro' );

1;
