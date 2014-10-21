package TagLib::ID3v2::UniqueFileIdentifierFrame;

use 5.008003;
use strict;
use warnings;

our $VERSION = '1.4';

use TagLib;

our @ISA = qw(TagLib::ID3v2::Frame);

# Preloaded methods go here.

1;
__END__
# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

TagLib::ID3v2::UniqueFileIdentifierFrame - An implementation of ID3v2
unique identifier frames 

=head1 SYNOPSIS

  use TagLib::ID3v2::UniqueFileIdentifierFrame;
  
  my $i = TagLib::ID3v2::UniqueFileIdentifierFrame->new(
    TagLib::ByteVector->new(""));
  $i->setOwner(TagLib::String->new("blah"));
  print $i->owner()->toCString(), "\n"; # got "blah"

=head1 DESCRIPTION

This is an implementation of ID3v2 unique file identifier frames. This
frame is used to identify the file in an arbitrary database identified
by the owner field.

=over

=item I<new(L<ByteVector|TagLib::ByteVector> $data)>

Creates a uniqe file identifier frame based on $data.

=item I<new(L<String|TagLib::String> $owner,
L<ByteVector|TagLib::ByteVector> $id)>

Creates a unique file identifier frame with the owner $owner and the
identification $id.

=item I<L<String|TagLib::String> owner()>

Returns the owner for the frame; essentially this is the key for
 determining which identification scheme this key belongs to. This
 will usually either be an email address or URL for the person or tool
 used to create the unique identifier.

see I<setOwner()>

=item I<L<ByteVector|TagLib::ByteVector> identifier()>

Returns the unique identifier. Though sometimes this is a text string
it also may be binary data and as much should be assumed when handling
it. 

=item I<void setOwner(L<String|TagLib::String> $s)>

Sets the owner of the identification scheme to $s.

see I<owner()>

=item I<void setIdentifier(L<ByteVector|TagLib::ByteVector> $v)>

Sets the unique file identifier to $v.

see I<identifier()>

=item I<L<String|TagLib::String> toString()>

see L<TagLib::ID3v2::Frame::toString()|TagLib::ID3v2::Frame>

=back

=head2 EXPORT

None by default.



=head1 SEE ALSO

L<TagLib|TagLib> L<Frame|TagLib::ID3v2::Frame>

=head1 AUTHOR

Dongxu Ma, E<lt>dongxu.ma@gmail.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2005 by Dongxu Ma

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.8.7 or,
at your option, any later version of Perl 5 you may have available.


=cut
