package TagLib;

use 5.008003;
use strict;
use warnings;

our $VERSION = '1.4';

require XSLoader;
XSLoader::load('TagLib', $VERSION);

# fill overload stash in each sub-package
use TagLib::APE::Footer;
use TagLib::APE::Item;
use TagLib::AudioProperties;
use TagLib::FLAC::Properties;
use TagLib::MPC::Properties;
use TagLib::MPEG::Properties;
use TagLib::Ogg::Vorbis::Properties;
use TagLib::Vorbis::Properties;
use TagLib::ByteVector;
use TagLib::ByteVector::Iterator;
use TagLib::File;
use TagLib::FLAC::File;
use TagLib::MPC::File;
use TagLib::MPEG::File;
use TagLib::Ogg::File;
use TagLib::Ogg::FLAC::File;
use TagLib::Ogg::Vorbis::File;
use TagLib::Vorbis::File;
use TagLib::FileRef;
use TagLib::FileRef::FileTypeResolver;
use TagLib::ID3v1::StringHandler;
use TagLib::ID3v2::ExtendedHeader;
use TagLib::ID3v2::Footer;
use TagLib::ID3v2::Frame;
use TagLib::ID3v2::AttachedPictureFrame;
use TagLib::ID3v2::CommentsFrame;
use TagLib::ID3v2::RelativeVolumeFrame;
use TagLib::ID3v2::TextIdentificationFrame;
use TagLib::ID3v2::UserTextIdentificationFrame;
use TagLib::ID3v2::UniqueFileIdentifierFrame;
use TagLib::ID3v2::UnknownFrame;
use TagLib::ID3v2::FrameFactory;
use TagLib::ID3v2::Header;
use TagLib::ID3v2::RelativeVolumeFrame::PeakVolume;
use TagLib::ByteVectorList;
use TagLib::StringList;
use TagLib::MPEG::Header;
use TagLib::MPEG::XingHeader;
use TagLib::Ogg::Page;
use TagLib::Ogg::PageHeader;
use TagLib::String;
use TagLib::String::Iterator;
use TagLib::Tag;
use TagLib::APE::Tag;
use TagLib::APE::ItemListMap;
use TagLib::APE::ItemListMap::Iterator;
use TagLib::ID3v1::Tag;
use TagLib::ID3v2::Tag;
use TagLib::ID3v2::FrameList;
use TagLib::ID3v2::FrameList::Iterator;
use TagLib::ID3v2::FrameListMap;
use TagLib::ID3v2::FrameListMap::Iterator;
use TagLib::Ogg::XiphComment;
use TagLib::Ogg::FieldListMap;
use TagLib::Ogg::FieldListMap::Iterator;
use TagLib::ID3v1;
use TagLib::ID3v1::GenreMap;
use TagLib::ID3v1::GenreMap::Iterator;
use TagLib::ID3v2::SynchData;

# Preloaded methods go here.

1;
__END__
# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

TagLib -  a library for reading and editing audio meta data, commonly 
know as I<tags>.

=head1 SYNOPSIS

  use TagLib;
  use warnings;
  use strict;

  my $f      = TagLib::FileRef->new("Latex Solar Beef.mp3");
  my $artist = $f->tag()->artist();
  print $artist->toCString(), "\n"; # got "Frank Zappa"

  $f->tag()->setAlbum(TagLib::String->new("Fillmore East"));
  $f->save();

  my $g      = TagLib::FileRef->new("Free City Rhymes.ogg");
  my $album  = $g->tag()->album();
  print $album->toCString(), "\n";  # got "NYC Ghosts & Flowers"

  $g->tag()->setTrack(1);
  $g->save();

B<Note> that these high level functions work for Ogg, FLAC, MPC and
MP3 (or any other formats supported in the future).  For this high
level API, which is suitable for most applications, the differences
between tag and file formats can all be ignored.

=head1 DESCRIPTION

Some goals of TagLib:
 - A clean, high level, C++ API to handling audio meta data.
 - Support for at least ID3v1, ID3v2 and Ogg Vorbis comments.
 - A generic, simple API for the most common tagging related functions.
 - Binary compatibility between minor releases using the standard
KDE/Qt techniques for C++ binary compatibility.
 - Make the tagging framework extensible by library users; i.e. it
will be possible for libarary users to implement  additional ID3v2
frames, without modifying the TagLib source (through the use of
I<Abstract Factories> and such.

Because TagLib desires to be toolkit agnostic, in hope of being widely
adopted and the most flexible in licensing
TagLib provides many of its own toolkit classes; in fact the only
external dependancy that TagLib has, it a semi-sane STL implementation.

=over

=item B<Why I<TagLib>> ?

 TagLib was written to fill a gap in the Open Source/Free Software
 community. Currently there is a lack in the OSS/FS for a homogenous
 API to the most common music types.

As TagLib will be initially injected into the KDE community, while it
has not been linked to any of the KDE or Qt libraries
Scott has tried to follow the coding style of those libraries.  Again,
this is in sharp contrast to id3lib, which basically provides a hybrid
C/C++ API and uses a dubious object model.

Scott gets asked rather frequently why he is replacing I<id3lib>
(mostly by people that have never worked with I<id3lib>), if you are
concerned about this please email him; He can provide his lengthy
standard rant. You can also email me if you like. I will talk to him
:-)

=back

=head2 EXPORT

None by default.

=head1 ENUM TYPE MAPPING

All over TagLib in Perl, ALL the enum value is mapped to a specific 
string. For instace, TagLib::String::UTF8 => "UTF8". Usually there
will be a hash you can query all the available values.

=head1 NAMESPACE ISSUE

TagLib::Ogg::Vorbis and TagLib::Vorbis are normally the same.

In C/C++, namespace Ogg is controlled by the macro DOXYGEN. When
defined, there will be TagLib::Ogg::Vorbis existing. Otherwize, they
just import all the symbols from TagLib::Vorbis to
TagLib::Ogg::Vorbis.

In Perl, nearly the same. It will make one stash be the alias of
another. Refer to TagLib::Ogg::Vorbis::File.pm, for instance.

=head1 OTHER STUFF YOU SHOULD KNOW

some methods will often return certain internal structure of an
instance, for example, I<tag()> & I<audioProperties()> in all
subclasses of L<AudioProperties|TagLib::AudioProperties>. In such
case, a READONLY flag is set on for the returned structure to bypass
I<DESTROY()>. 

=head1 SEE ALSO

F<http://developer.kde.org/~wheeler/taglib.html>

=head1 KNOWN BUGS

Refer to I<Bugs> in the top level of the package

=head1 AUTHOR

C/C++ library by Scott Wheeler E<lt>wheeler@kde.orgE<gt> Allan
Sandfeld Jenson E<lt>kde@carewolf.orgE<gt> and Ismael Orenstein
E<lt>orenstein@kde.orgE<gt>  

Perl module by Dongxu Ma E<lt>dongxu.ma@gmail.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2005 by Dongxu Ma

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.8.7 or,
at your option, any later version of Perl 5 you may have available.


=cut
