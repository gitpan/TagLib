package TagLib::FLAC::Properties;

use 5.008003;
use strict;
use warnings;

our $VERSION = '1.4';

use TagLib;

our @ISA = qw(TagLib::AudioProperties);

# Preloaded methods go here.

1;
__END__
# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

TagLib::FLAC::Properties - An implementation of audio property reading
for FLAC 

=head1 SYNOPSIS

  use TagLib::FLAC::Properties;
  
  my $i = TagLib::FLAC::Properties->new("sample file.flac");
  print $i->channels(); # should be 2 usually

=head1 DESCRIPTION

This reads the data from an FLAC stream found in the AudioProperties
API. 

=over

=item I<new(L<ByteVector|TagLib::ByteVector> $data, IV $streamLength,
L<PV|TagLib::AudioProperties> $style = "Average")>

Create an instance of FLAC::Properties with the data read from the
ByteVector $data.

=item I<new(L<File|TagLib::FLAC::File> $file,
L<PV|TagLib::AudioProperties> $style = "Average")>

Create an instance of FLAC::Properties with the data read from the
FLAC::File $file.

=item I<DESTROY()>

Destroys this FLAC::Properties instance.

=item I<IV length()>

=item I<IV bitrate()>

=item I<IV sampleRate()>

=item I<IV channels()>

see L<AudioProperties|TagLib::AudioProperties>

=item I<sampleWidth()>

Returns the sample width as read from the FLAC identification header. 

=back

=head2 EXPORT

None by default.



=head1 SEE ALSO

L<TagLib|TagLib> L<AudioProperties|TagLib::AudioProperties>

=head1 AUTHOR

Dongxu Ma, E<lt>dongxu.ma@gmail.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2005 by Dongxu Ma

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.8.7 or,
at your option, any later version of Perl 5 you may have available.


=cut
