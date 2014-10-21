package TagLib::ID3v2::SynchData;

use 5.008003;
use strict;
use warnings;

our $VERSION = '1.4';

use TagLib;

# Preloaded methods go here.

1;
__END__
# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

TagLib::ID3v2::SynchData - A few functions for ID3v2 synch safe
integer conversion 

=head1 SYNOPSIS

  use TagLib::ID3v2::SynchData;
  
  print TagLib::ID3v2::SynchData->toUInt(
    TagLib::ByteVector->new("11")), "\n"; # got 6321
  print TagLib::ID3v2::SynchData->fromUInt(6321)->data(), "\n"; 
  # got "11"

=head1 DESCRIPTION

In the ID3v2.4 standard most integer values are encoded as "synch
safe" integers which are encoded in such a way that they will not give
false MPEG syncs and confuse MPEG decoders. This namespace provides
some methods for converting to and from these values to ByteVectors
for things rendering and parsing ID3v2 data.

=over

=item I<UV toUInt(L<ByteVector|TagLib::ByteVector> $data)>

This returns the unsigned integer value of $data where $data is a
ByteVector that contains synchsafe integer. The default length of 4 is
used if another value is not specified.

=item I<L<ByteVector|TagLib::ByteVector> fromUInt(UV $value)>

Returns a 4 byte (32 bit) synchsafe integer based on $value.

=back

=head2 EXPORT

None by default.



=head1 SEE ALSO

L<TagLib|TagLib>

=head1 AUTHOR

Dongxu Ma, E<lt>dongxu.ma@gmail.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2005 by Dongxu Ma

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.8.7 or,
at your option, any later version of Perl 5 you may have available.


=cut
