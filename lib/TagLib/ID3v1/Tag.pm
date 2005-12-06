package TagLib::ID3v1::Tag;

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

TagLib::ID3v1::Tag - An ID3v1 tag implementation

=head1 SYNOPSIS

  use TagLib::ID3v1::Tag;
  
  my $i = TagLib::ID3v1::Tag->new();
  $i->setYear(1981);
  print $i->year(), "\n"; # got 1981

=head1 DESCRIPTION

This is an implementation of the ID3v1 format.  ID3v1 is both the
simplist and most common of tag formats but is rather limited.
Because of its pervasiveness and the way that applications have been
written around the fields that it provides, the generic TagLib::Tag
API is a mirror of what is provided by ID3v1.

ID3v1 tags should generally only contain Latin1 information.  However
because many applications do not follow this rule there is now support
for overriding the ID3v1 string handling using the
ID3v1::StringHandler class.  Please see the documentation for that
class for more information. 

see L<StringHandler|TagLib::ID3v1::StringHandler>

B<NOTE> Most fields are truncated to a maximum of 28-30 bytes. The
truncation happens automatically when the tag is rendered.

=over

=item I<new()>

Create an ID3v1 tag with default values.

=item I<new(L<File|TagLib::File> $file, IV $tagOffset)>

Create an ID3v1 tag and parse the data in $file starting at
$tagOffset. 

=item I<DESTROY()>

Destroys this Tag instance.

=item I<L<ByteVector|TagLib::ByteVector> render()>

Renders the in memory values to a ByteVector suitable for writing to
the file.

=item I<L<ByteVector|TagLib::ByteVector> fileIdentifier()> [static]

Returns the string "TAG" suitable for usage in locating the tag in a
  file. 

=item I<L<String|TagLib::String> title()>

=item I<L<String|TagLib::String> artist()>

=item I<L<String|TagLib::String> album()>

=item I<L<String|TagLib::String> comment()>

=item I<L<String|TagLib::String> genre()>

=item I<UV year()>

=item I<UV track()>

=item I<void setTitle(L<String|TagLib::String> $s)>

=item I<void setArist(L<String|TagLib::String> $s)>

=item I<void setAlbum(L<String|TagLib::String> $s)>

=item I<void setComment(L<String|TagLib::String> $s)>

=item I<void setGenre(L<String|TagLib::String> $s)>

=item I<void setYear(UV $i)>

=item I<void setTrack(UV $i)>

see L<Tag|TagLib::Tag>

=item I<void
setStringHandler(L<StringHandler|TagLib::ID3v1::StringHandler>
$handler)> [static]

Sets the string handler that decides how the ID3v1 data will be
converted to and from binary data. 

see L<StringHandler|TagLib::ID3v1::StringHandler>

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
