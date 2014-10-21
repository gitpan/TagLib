package TagLib::MPEG::Properties;

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

TagLib::MPEG::Properties - An implementation of audio property reading
for MP3 

=head1 SYNOPSIS

  use TagLib::MPEG::Properties;
  
  my $f = TagLib::MPEG::File->new("sample file.mp3");
  my $i = $f->audioProperties();
  print $i->layer(), "\n"; # got 3

=head1 DESCRIPTION

This reads the data from an MPEG Layer III stream found in the
AudioProperties API. 

=over

=item I<new(PV $file, PV $style = "Average")>

Create an instance of MPEG::Properties with the data read from the
MPEG::File $file.

=item I<DESTROY()>

Destroys this MPEG Properties instance.

=item I<IV length()>

=item I<IV bitrate()>

=item I<IV sampleRate()>

=item I<IV channels()>

see L<AudioProperties|TagLib::AudioProperties>

=item I<PV version()>

Returns the MPEG Version of the file.

see L<TagLib::MPEG::Header|TagLib::MPEG::Header>

=item I<IV layer()>

Returns the layer version. This will be between the values 1-3.

=item I<BOOL protectionEnabled()>

Returns true if the MPEG protection bit is enabled.

=item I<PV channelMode()>

Returns the channel mode for this frame.

see L<TagLib::MPEG::Header|TagLib::MPEG::Header> 

=item I<BOOL isCopyrighted()>

Returns true if the copyrighted bit is set.

=item I<BOOL isOriginal()>

Returns true if the "original" bit is set.


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
