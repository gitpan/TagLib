package TagLib::ID3v2::UnknownFrame;

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

TagLib::ID3v2::UnknownFrame - A frame type unkown to TagLib

=head1 SYNOPSIS

  use TagLib::ID3v2::UnknownFrame;
  
  my $i = TagLib::ID3v2::UnknownFrame->new(
    TagLib::ByteVector->new("blah"));
  print $i->data()->data(), "\n"; # got "blah"

=head1 DESCRIPTION

This class represents a frame type not known (or more often simply
unimplemented) in TagLib. This is here provide a basic API for
manipulating the binary data of unknown frames and to provide a means
of rendering such unknown frames.

Please note that a cleaner way of handling frame types that TagLib
does not understand is to subclass ID3v2::Frame and
ID3v2::FrameFactory to have your frame type supported through the
standard ID3v2 mechanism. 

=over

=item I<new(L<ByteVector|TagLib::ByteVector> $data)>

Constructs an unknown frame based on $data.

=item I<DESTROY()>

Destroys the instance.

=item I<L<String|TagLib::String> toString()>

see L<TagLib::ID3v2::Frame::toString()|TagLib::ID3v2::Frame>

=item I<L<ByteVector|TagLib::ByteVector> data()>

Returns the field data (everything but the header) for this frame. 

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
