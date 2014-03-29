package CPAN::Cover::Results::Iterator;

use Moo;
use autodie;
use JSON qw/ decode_json /;
use Carp;

use CPAN::Cover::Results::Distribution;

has 'results'       => ( is => 'ro'   );
has '_results_data' => ( is => 'lazy' );

sub _build__results_data
{
    my $self = shift;
    local $/;
    my $fh;

    open($fh, '<', $self->results->path);
    my $data_ref = <$fh>;
    close($fh);
    return decode_json($data_ref);
}

sub next
{
    my $self = shift;
    my $data_ref = $self->_results_data;
    my ($key, $value, $distname, $version);

    do {
        ($key, $value) = each %$data_ref;
        return undef unless defined($key) && defined($value);
        ($distname, $version) = $key =~ /^(.*?)[\.-]v?([0-9].*)$/;
    } while (!defined($distname) || !defined($version));

    $value->{name} = $distname;
    $value->{version} = $version;

    return CPAN::Cover::Results::Distribution->new($value);
}

1;

