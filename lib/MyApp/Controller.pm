package MyApp::Controller;
use strict;
use warnings;

sub new {
    my $class = shift;
    my $self = {};
    bless $self, $class;
    return $self;
}

sub hello {
    return "Hello, World!";
}

1;