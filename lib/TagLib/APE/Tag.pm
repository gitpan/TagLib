package TagLib::APE::Tag;

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

TagLib::APE::Tag - An APE tag implementation

=head1 SYNOPSIS

  use TagLib::APE::Tag;
  
  my $i = TagLib::APE::Tag();
  $i->setTitle(TagLib::String->new("title"));
  print $i->title()->toCString(), "\n"; # got "title"

=head1 DESCRIPTION

B<Note>: Inherit from L<Tag|TagLib::Tag>

=over

=item I<new()>

Create an APE tag with default values.

=item I<new(L<File|TagLib::File> $file, IV $tagOffset)>

Create an APE tag and parse the data in $file with APE footer at a
  $tagOffset. 

=item I<DESTROY()>

 Destroys this Tag instance.

=item I<L<ByteVector|TagLib::ByteVector> render()>

Renders the in memory values to a ByteVector suitable for writing to
  the file.

=item I<L<ByteVector|TagLib::ByteVector> fileIdentifier()> [static]

Returns the string "APETAGEX" suitable for usage in locating the tag
in a file.

=item I<L<String|TagLib::String> title()>

=item I<L<String|TagLib::String> artist()>

=item I<L<String|TagLib::String> album()>

=item I<L<String|TagLib::String> comment()>

=item I<L<String|TagLib::String> genre()>

=item I<IV year()>

=item I<IV track()>

=item I<void setTitle(L<String|TagLib::String> $s)>

=item I<void setArtist(L<String|TagLib::String> $s)>

=item I<void setAlbum(L<String|TagLib::String> $s)>

=item I<void setComment(L<String|TagLib::String> $s)>

=item I<void setGenre(L<String|TagLib::String> $s)>

=item I<void setYear(IV $i)>

=item I<void setTrack(IV $i)>

see L<Tag|TagLib::Tag>

=item I<L<Footer|TagLib::APE::Footer> footer()>

Returns a pointer to the tag's footer.

=item I<RV itemListMap()>

Returns a reference to a hash, which is tied with the returned item
list map in C/C++ code. 
 This is an ItemListMap of all of the items in the tag.

This is the most powerfull structure for accessing the items of the
tag. 

B<warning>  You should not modify this data structure directly,
instead use I<setItem()> and I<removeItem()>.

=item I<void removeItem(L<String|TagLib::String> $key)>

 Removes the $key item from the tag

=item I<void addValue(L<String|TagLib::String> $key,
L<String|TagLib::String> $value, BOOL $replace=TRUE)>

Adds to the item specified by $key the data $value.  If $replace is
true, then all of the other values on the same key will be removed
first. 

=item I<void setItem(L<String|TagLib::String> $key,
L<Item|TagLib::APE::Item> $item)>

Sets the $key item to the value of $item. If an item with the $key is
already present, it will be replaced.

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
