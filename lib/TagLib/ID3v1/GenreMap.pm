package TagLib::ID3v1::GenreMap;

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

TagLib::ID3v1::GenreMap - Perl-only class

=head1 SYNOPSIS

  use TagLib::ID3v1::GenreMap;
  
  my $map = TagLib::ID3v1->genreMap();
  tie my %map, ref($map), $map;
  print $map{(keys %map)[0]}, "\n"; # got 123
  my ($first) = keys %map;
  print $first->toCString(), "\n"; # got "A Cappella"

=head1 DESCRIPTION

Implements TagLib::ID3v1::GenreMap in C/C++ code, which is of type
L<Map|TagLib::Map>E<lt>L<String|TagLib::String>, intE<gt>.

Optionally, you can tie an instance of ItemListMap with a hash symbol,
just like this: C<tie my %h, ref($i), $i;>, Then operate throught
I<%h>.

see L<TagLib::ID3v1::genreMap()|TagLib::ID3v1>

=over

=item I<new()>

Constructs an empty GenreMap.

=item I<new(L<GenreMap|TagLib::ID3v1::GenreMap> $m)>

Make a shallow, implicitly shared, copy of $m.

=item I<DESTROY()>

Destroys this instance of the GenreMap.

=item I<L<Iterator|TagLib::ID3v1::GenreMap::Iterator> begin()>

Returns an STL style iterator to the beginning of the map.

see
L<TagLib::ID3v1::GenreMap::Iterator|TagLib::ID3v1::GenreMap::Iterator>

=item I<L<Iterator|TagLib::ID3v1::GenreMap::Iterator> end()>

Returns an STL style iterator to the end of the map.

see
L<TagLib::ID3v1::GenreMap::Iterator|TagLib::ID3v1::GenreMap::Iterator>

=item I<void insert(L<String|TagLib::String> $key, IV $value)>

Inserts $value under $key in the map. If a value for $key already
  exists it will be overwritten. 

=item I<void clear()>

Removes all of the elements from elements from the map. This however
will not free memory of all the items.

=item I<UV size()>

The number of elements in the map.

see I<isEmpty()>

=item I<BOOL isEmpty()>

Returns true if the map is empty.

see I<size()>

=item I<L<Iterator|TagLib::ID3v1::GenreMap::Iterator>
find(L<String|TagLib::String> $key)>

Find the first occurance of $key.

=item I<BOOL contains(L<String|TagLib::String> $key)>

Returns true if the map contains an instance of $key.

=item I<void erase(L<Iterator|TagLib::ID3v1::GenreMap::Iterator>
$it)>

Erase the item at $it from the list.

=item I<IV getItem(L<String|TagLib::String> $key)>

Returns the value associated with $key.

note This has undefined behavior if the key is not present in the map.

=item I<copy(L<GenreMap|TagLib::ID3v1::GenreMap> $m)>

Make a shallow, implicitly shared, copy of $m.

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
