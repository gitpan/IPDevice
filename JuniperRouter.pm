#!/usr/bin/env perl
####
## Copyright (C) 2003 Samuel Abels, <spam debain org>
## This program is free software; you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 2 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program; if not, write to the Free Software
## Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
####

####
## This file provides a class for holding informations regarding a Cisco
## router.
####

package IPDevice::JuniperRouter;
use IPDevice::RouterBase;
use strict;
use vars qw($VERSION @ISA);
@ISA = qw(IPDevice::RouterBase);

$VERSION = 0.01;

use constant TRUE  => 1;
use constant FALSE => 0;


=head1 NAME

IPDevice::JuniperRouter

=head1 SYNOPSIS

 use IPDevice::JuniperRouter;
 my $router = new IPDevice::JuniperRouter;
 $router->set_hostname('hostname');
 my $card = $router->add_card('0');
 $card->add_module('0/1');

=head1 DESCRIPTION

This module provides routines for storing informations regarding a Juniper
router.

=head1 CONSTRUCTOR AND METHODS

This module provides, in addition to all methods from
L<IPDevice::RouterBase|IPDevice::RouterBase>, the following methods.

=cut


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
