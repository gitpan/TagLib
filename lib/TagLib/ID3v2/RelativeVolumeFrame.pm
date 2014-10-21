package TagLib::ID3v2::RelativeVolumeFrame;

use 5.008003;
use strict;
use warnings;

our $VERSION = '1.4';

use TagLib;

our @ISA = qw(TagLib::ID3v2::Frame);

our %_ChannelType = (
    "Other"        => "0x00",
    "MasterVolume" => "0x01",
    "FrontRight"   => "0x02",
    "FrontLeft"    => "0x03",
    "BackRight"    => "0x04",
    "Backleft"     => "0x05",
    "FrontCentre"  => "0x06",
    "BackCentre"   => "0x07",
    "Subwoofer"    => "0x08",
);

# Preloaded methods go here.

1;
__END__
# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

TagLib::ID3v2::RelativeVolumeFrame - An ID3v2 relative volume
adjustment frame implementation 

=head1 SYNOPSIS

  use TagLib::ID3v2::RelativeVolumeFrame;
  
  my $i = TagLib::ID3v2::RelativeVolumeFrame->new(
    TagLib::ByteVector->new(""));
  $i->setChannelType("MasterVolume");
  print $i->channelType(), "\n"; # got "MasterVolume"

=head1 DESCRIPTION

This is an implementation of ID3v2 relative volume adjustment. The
presense of this frame makes it possible to specify an increase in
volume for an audio file or specific audio tracks in that file.

Multiple relative volume adjustment frames may be present in the tag
each with a unique identification and describing volume adjustment for
different channel types.

=over

=item I<new()>

Constructs a RelativeVolumeFrame. The relevant data should be set
 manually. 

=item I<new(L<ByteVector|TagLib::ByteVector> $data)>

Constructs a RelativeVolumeFrame based on the contents of $data. 

=item I<DESTROY()>

Destroys the RelativeVolumeFrame instance.

=item I<L<String|TagLib::String> toString()>

Returns the frame's identification.

see I<identification()>

=item I<LIST channles()>

Returns a list of channels with information currently in the frame.

B<NOTE> This should be a list of PV which indicates the ChannelType.

see %_ChannelType

=item I<PV channelType()>

Always returns master volume.

B<deprecated>

=item I<void setChannelType(PV $t)>

This method no longer has any effect.

B<deprecated>

=item I<IV volumeAdjustmentIndex(PV $type = "MasterVolume")>

Returns the relative volume adjustment "index". As indicated by the
ID3v2 standard this is a 16-bit signed integer that reflects the
decibils of adjustment when divided by 512.

This defaults to returning the value for the master volume channel if
available and returns 0 if the specified channel does not exist.

see I<setVolumeAdjustmentIndex()>

see I<volumeAjustment()>

=item I<void setVolumeAdjustmentIndex(IV $index, PV $type =
"MasterVolume")> 

Set the volume adjustment to $index. As indicated by the ID3v2
 standard this is a 16-bit signed integer that reflects the decibils
 of adjustment when divided by 512.

By default this sets the value for the master volume.

see I<volumeAdjustmentIndex()>

see I<setVolumeAdjustment()>

=item <NV volumeAdjustment(PV $type = "MasterVolume")>

Returns the relative volume adjustment in decibels.

B<NOTE> Because this is actually stored internally as an "index" to
this value the value returned by this method may not be identical to
the value set using setVolumeAdjustment().

This defaults to returning the value for the master volume channel if
available and returns 0 if the specified channel does not exist. 

see I<setVolumeAdjustment()>

see I<volumeAdjustmentIndex()>

=item I<void setVolumeAdjustment(NV $adjustment, PV $type =
"MasterVolume")> 

Set the relative volume adjustment in decibels to $adjustment.

By default this sets the value for the master volume.

B<NOTE> Because this is actually stored internally as an "index" to
this value the value set by this method may not be identical to the
one returned by volumeAdjustment().

see I<setVolumeAdjustment()>

see I<volumeAdjustmentIndex()>

=item I<L<PeakVolume|TagLib::ID3v2::RelativeVolumeFrame::PeakVolume>
peakVolume(PV $type = "MasterVolume")>

Returns the peak volume (represented as a length and a string of
 bits). 

This defaults to returning the value for the master volume channel if
 available and returns 0 if the specified channel does not exist.

see I<setPeakVolume()>

=item
I<setPeakVolume(L<PeakVolume|TagLib::ID3v2::RelativeVolumeFrame::PeakVolume>
$peak, PV $type = "MasterVolume")>

Sets the peak volume to $peak.

By default this sets the value for the master volume.

see I<peakVolume()>

=item %_ChannelType

This indicates the type of volume adjustment that should be
 applied. C<keys %TagLib::ID3v2::RelativeVolumeFrame::_ChannelType>
 lists all available values used in Perl code.



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
