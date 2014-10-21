package TagLib::FileRef::FileTypeResolver;

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

TagLib::FileRef::FileTypeResolver -  A class for pluggable file type resolution.

=head1 DESCRIPTION

This class is used to add extend TagLib's very basic file name based
file type resolution.

This can be accomplished with:

  package TagLib::FileRef::MyFileTypeResolver;

  our @ISA = qw(TagLib::FileRef::FileTypeResolver);

  sub createFile() {
      my $package  = shift;
      my $filename = shift;
      if(&someCheckForAnMP3File($filename)) {
          my $file = TagLib::MPEG::File->new($filename);
          # skip DESTROY() in Perl level
          $file->_setReadOnly();
          return $file;
      }
      return undef;
  }
  
  package main;
  
  TagLib::FileRef->addFileTypeResolver(
      TagLib::FileRef::MyFileTypeResolver->new());

Naturally a less contrived example would be slightly more
 complex. This can be used to plug in mime-type detection systems or
 to add new file types to TagLib.

=over

=item I<L<File|TagLib::File> createFile(PV $fileName, BOOL
$readAudioProperties = TRUE, L<PV|TagLib::AudioProperties>
$audioPropertiesStyle = "Average")> [pure virtual]

This method must be overriden to provide an additional file type
resolver. If the resolver is able to determine the file type it should
return a valid File object; if not it should return undef.

B<NOTE> The created file is then owned by the FileRef and should not
be deleted. Deletion will happen automatically when the FileRef passes
out of scope.

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
