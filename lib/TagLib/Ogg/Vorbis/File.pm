package TagLib::Ogg::Vorbis::File;

use 5.008003;
use strict;
use warnings;

our $VERSION = '1.4';

use TagLib;

our @ISA = qw(TagLib::Ogg::File);

# Preloaded methods go here.

BEGIN : 
  {
      no strict 'refs';
      unless (grep {/^new$/ } keys %__PACKAGE__::) {
          *TagLib::Ogg::Vorbis::File:: = *TagLib::Vorbis::File:: ;
            
      }
  }

1;
__END__
# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

TagLib::Ogg::Vorbis::File - An implementation of Ogg::File with Vorbis
specific methods 

=head1 SYNOPSIS

  use TagLib::Ogg::Vorbis::File;
  
  my $i = TagLib::Ogg::Vorbis::File->new("sample vorblis file.ogg");
  print $i->tag()->comment()->toCString(), "\n"; # got comment

=head1 DESCRIPTION

This is the central class in the Ogg Vorbis metadata processing
collection of classes. It's built upon Ogg::File which handles
processing of the Ogg logical bitstream and breaking it down into
pages which are handled by the codec implementations, in this case
Vorbis specifically. 

=over

=item I<new(PV $file, BOOL $readProperties = TRUE, PV $propertiesStyle
= "Average")>

Contructs a Vorbis file from $file. If $readProperties is true the
file's audio properties will also be read using $propertiesStyle. If
false, $propertiesStyle is ignored.

=item I<DESTROY()>

Destroys this instance of the File.

=item I<L<Ogg::XiphComment|TagLib::Ogg::XiphComment> tag()>

Returns the XiphComment for this file. XiphComment implements the tag
interface, so this serves as the reimplementation of
TagLib::File::tag(). 

=item I<L<Properties|TagLib::Ogg::Vorbis::Properties>
audioProperties()>

Returns the Vorbis::Properties for this file. If no audio properties
were read then this will return undef.

=item I<BOOL save()>

Saves the File.

=back

=head2 EXPORT

None by default.



=head1 SEE ALSO

L<TagLib|TagLib> L<Ogg::File|TagLib::Ogg::File>

=head1 AUTHOR

Dongxu Ma, E<lt>dongxu.ma@gmail.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2005 by Dongxu Ma

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.8.7 or,
at your option, any later version of Perl 5 you may have available.


=cut
