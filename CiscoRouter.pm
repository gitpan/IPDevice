#!/usr/bin/env perl
####
## This file provides a class for holding informations regarding a Cisco
## router.
####

package IPDevice::CiscoRouter;
use IPDevice::RouterBase;
use IPDevice::CiscoRouter::Accesslist;
use IPDevice::CiscoRouter::Card;
use strict;
use vars qw($VERSION @ISA);
@ISA = qw(IPDevice::RouterBase);

$VERSION = 0.01;

use constant TRUE  => 1;
use constant FALSE => 0;


=head1 NAME

IPDevice::CiscoRouter

=head1 SYNOPSIS

 use IPDevice::CiscoRouter;
 my $router = new IPDevice::CiscoRouter;
 $router->set_hostname('hostname');
 my $card = $router->card(0);
 my $acl  = $router->accesslist('DENYSTUPIDS');

=head1 DESCRIPTION

This module provides routines for storing informations regarding a Cisco router.

=head1 CONSTRUCTOR AND METHODS

This module provides, in addition to all methods from L<Router|Router>, the
following methods.

=head2 accesslist($name)

Returns the
L<IPDevice::CiscoRouter::Accesslist|IPDevice::CiscoRouter::Accesslist> with the
given name. If the
L<IPDevice::CiscoRouter::Accesslist|IPDevice::CiscoRouter::Accesslist> does not
yet exist, it will be created.

=cut
sub accesslist {
  my($self, $name) = @_;
  return $self->{accesslists}->{$name} if $self->{accesslists}->{$name};
  my $accesslist = new IPDevice::CiscoRouter::Accesslist(name => $name);
  return $self->{accesslists}->{$name} = $accesslist;
}


=head1 COPYRIGHT

Copyright (c) 2004 Samuel Abels.
All rights reserved.

This library is free software; you can redistribute it and/or
modify it under the same terms as Perl itself.

=head1 AUTHOR

Samuel Abels <spam debain org>

=cut

1;

__END__
