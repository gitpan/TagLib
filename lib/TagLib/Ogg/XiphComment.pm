package TagLib::Ogg::XiphComment;

use 5.008003;
use strict;
use warnings;

our $VERSION = '1.4';

use TagLib;

our @ISA = qw(TagLib::Tag);

# Preloaded methods go here.

1;
__END__
# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

TagLib::Ogg::XiphComment - Ogg Vorbis comment implementation

=head1 SYNOPSIS

  use TagLib::Ogg::XiphComment;
  
  my $i = TagLib::Ogg::XiphComment->new();
  $i->setGenre(TagLib::String->new("genre"));
  print $i->genre()->toCString(), "\n"; # got "genre"

=head1 DESCRIPTION

This class is an implementation of the Ogg Vorbis comment
specification, to be found in section 5 of the Ogg Vorbis
specification. Because this format is also used in other (currently
unsupported) Xiph.org formats, it has been made part of a generic
implementation rather than being limited to strictly Vorbis.

Vorbis comments are a simple vector of keys and values, called
fields. Multiple values for a given key are supported.

see I<fieldListMap()>

=over

=item I<new()>

Constructs an empty Vorbis comment.

=item I<new(L<ByteVector|TagLib::ByteVector> $data)>

Constructs a Vorbis comment from $data.

=item I<DESTROY()>

Destroys this instance of the XiphComment.

=item I<L<String|TagLib::String> title()>

=item I<L<String|TagLib::String> artist()>

=item I<L<String|TagLib::String> album()>

=item I<L<String|TagLib::String> comment()>

=item I<L<String|TagLib::String> genre()>

=item I<UV year()>

=item I<UV track()>

=item I<void setTitle(L<String|TagLib::String> $s)>

=item I<void setArtist(L<String|TagLib::String> $s)>

=item I<void setAlbum(L<String|TagLib::String> $s)>

=item I<void setComment(L<String|TagLib::String> $s)>

=item I<void setYear(UV $i)>

=item I<void setTrack(UV $i)>

=item I<BOOL isEmpty()>

see L<Tag|TagLib::Tag>

=item I<UV fieldCount()>

Returns the number of fields present in the comment.

=item I<L<FiledListMap|TagLib::Ogg::FiledListMap> fieldListMap()>

Returns a reference to the map of field lists. Because Xiph comments
support multiple fields with the same key, a pure Map would not
work. As such this is a Map of string lists, keyed on the comment
field name. 

The standard set of Xiph/Vorbis fields (which may or may not be
 contained in any specific comment) is:

qw(TITLE VERSION ALBUM ARTIST PERFORMER COPYRIGHT ORGRAIZATION
   DESCRIPTION GENRE DATE LOCATION CONTACT ISRC)

For a more detailed description of these fields, please see the Ogg
 Vorbis specification, section 5.2.2.1.

B<NOTE> The Ogg Vorbis comment specification does allow these key
 values to be either upper or lower case. However, it is conventional
 for them to be upper case. As such, TagLib, when parsing a
 Xiph/Vorbis comment, converts all fields to uppercase. When you are
 using this data structure, you will need to specify the field name in
 upper case. 

B<WARNING> You should not modify this data structure directly, instead
 use addField() and removeField().

=item I<L<String|TagLib::String> vendorID()>

Returns the vendor ID of the Ogg Vorbis encoder. libvorbis 1.0 as the
most common case always returns "Xiph.Org libVorbis I 20020717".

=item I<void addField(L<String|TagLib::String> $key,
L<String|TagLib::String> $value, BOOL $replace = TRUE)>

Add the field specified by $key with the data $value. If $replace is
true, then all of the other fields with the same key will be removed
frist. 

If the field value is empty, the field will be removed.

=item I<void removeField(L<String|TagLib::String> $key,
L<String|TagLib::String> $value = String::null)>

Remove the field specified by $key with the data $value. If $value is
null, all of the fields with the given key will be removed.

=item I<L<ByteVector|TagLib::ByteVector> render()>

Renders the comment to a ByteVector suitable for inserting into a
 file. 

=item I<L<ByteVector|TagLib::ByteVector> render(BOOL $addFramingBit)>

Renders the comment to a ByteVector suitable for inserting into a
file. If $addFramingBit is true the standard Vorbis comment framing
bit will be appended. However some formats (notably FLAC) do not work
with this in place.


=back

=head2 EXPORT

None by default.



=head1 SEE ALSO

L<TagLib|TagLib> L<Tag|TagLib::Tag>

=head1 AUTHOR

Dongxu Ma, E<lt>dongxu.ma@gmail.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2005 by Dongxu Ma

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.8.7 or,
at your option, any later version of Perl 5 you may have available.


=cut
