package ExtUtils::Typemaps::Signal;

use strict;
use warnings;

use parent 'ExtUtils::Typemaps';

use ExtUtils::Typemaps::Signo;
use ExtUtils::Typemaps::SigSet;
use ExtUtils::Typemaps::TimeSpec;

sub new {
	my $class = shift;

	my $self = $class->SUPER::new(@_);

	$self->merge(typemap => ExtUtils::Typemaps::Signo->new);
	$self->merge(typemap => ExtUtils::Typemaps::SigSet->new);
	$self->merge(typemap => ExtUtils::Typemaps::TimeSpec->new);

	return $self;
}

1;

#ABSTRACT: A typemap bundle for dealing with signal related types


=head1 SYNOPSIS

 use ExtUtils::Typemaps::Signal;
 # First, read my own type maps:
 my $private_map = ExtUtils::Typemaps->new(file => 'my.map');

 # Then, get the Signal set and merge it into my maps
 my $map = ExtUtils::Typemaps::Signal->new;
 $private_map->merge(typemap => $map);

 # Now, write the combined map to an output file
 $private_map->write(file => 'typemap');

=head1 DESCRIPTION

ExtUtils::Typemaps::Signal is an ExtUtils::Typemaps subclass that provides several useful typemaps when dealing with signalling code. It's an aggregation of the following typemaps:

=over 4

=item * L<ExtUtils::Typemaps::Signo>

=item * L<ExtUtils::Typemaps::SigSet>

=item * L<ExtUtils::Typemaps::TimeSpec>

=back
