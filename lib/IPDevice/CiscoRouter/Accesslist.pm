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
## This file provides a class for holding informations about a Cisco accesslist.
####

package IPDevice::CiscoRouter::Accesslist;
use IPDevice::CiscoRouter::AccesslistEntry;
use strict;
use vars qw($VERSION);

$VERSION = 0.01;

use constant TRUE  => 1;
use constant FALSE => 0;


=head1 NAME

IPDevice::CiscoRouter::Accesslist

=head1 SYNOPSIS

 use IPDevice::CiscoRouter::Accesslist;
 my $acl = new IPDevice::CiscoRouter::Accesslist;
 $acl->set_id(10);
 $acl->add_entry('permit', '192.168.0.0/22', '20', '24');

=head1 DESCRIPTION

This module provides routines for storing informations regarding a Cisco
accesslist entry.

=head1 CONSTRUCTOR AND METHODS

=head2 new([%args])

Object constructor. Valid arguments:

I<id>: The accesslist number.

=cut
sub new {
	my($class, %args) = @_;
	$class = ref($class) || $class;
	my $self = {};
	bless $self, $class;
	return $self->_init(%args);
}


## Purpose: Initialize a new accesslist.
##
sub _init {
  my($self, %args) = @_;
  $self->{id} = $args{id} * 1 if $args{id};
  return $self;
}


=head2 set_id($id)

Set the accesslist number. (INTEGER)

=cut
sub set_id {
  my($self, $id) = @_;
  $self->{id} = $id * 1;
}


=head2 get_id()

Returns the accesslist number. (INTEGER)

=cut
sub get_id {
  my $self = shift;
  return $self->{id};
}


=head2 add_entry($permitdeny, @fields)

Adds a new entry to the accesslist.
Returns TRUE on success, otherwise FALSE.

=cut
sub add_entry {
  my($self, $permitdeny, @fields) = @_;
  my $aclentry = new IPDevice::CiscoRouter::AccesslistEntry;
  return FALSE if !$aclentry->set_permitdeny($permitdeny);
  my $i = 0;
  for my $field (@fields) {
    return FALSE if !$aclentry->set_field($i, $field);
  }
  push(@{$self->{accesslist}}, $aclentry);
  return TRUE;
}


=head2 for_each($func, $data)

Walks through the ACL calling the function $func for every ACL statement.
Args passed to $func are:

I<$aclentry>: The
L<IPDevice::CiscoRouter::AccesslistEntry|IPDevice::CiscoRouter::AccesslistEntry>.
I<$data>: The given data, just piped through.

If $func returns FALSE, list evaluation will be stopped.

=cut
sub for_each {
  my($self, $func, $data) = @_;
  for my $aclentry (@{$self->{accesslist}}) {
    return if !$func->($aclentry, $data);
  }
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
