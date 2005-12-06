package TagLib::MPC::Properties;

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

TagLib::MPC::Properties - An implementation of audio property reading
for MPC 

=head1 SYNOPSIS

  use TagLib::MPC::Properties;
  
  my $f = TagLib::MPC::File->new("sample mpc file.mpc");
  my $i = $f->audioProperties();
  print $i->channels(), "\n"; # normally got 2

=head1 DESCRIPTION

This reads the data from an MPC stream found in the AudioProperties
API. 

=over

=item I<new(L<ByteVector|TagLib::ByteVector> $data, IV $streamLength,
PV $style = "Average")>

Create an instance of MPC::Properties with the data read from the
ByteVector $data.

=item I<DESTROY()>

Destroys this MPC::Properties instance.

=item I<IV length()>

=item I<IV bitrate()>

=item I<IV sampleRate()>

=item I<IV channels()>

see L<AudioProperties|TagLib::AudioProperties>

=item I<IV mpcVersion()>

Returns the version of the bitstream (SV4-SV7)

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
