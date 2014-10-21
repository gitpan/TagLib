package TagLib::ID3v1;

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

TagLib::ID3v1 - Functions in this namespace

=head1 SYNOPSIS

  use TagLib::ID3v1;
  
  my $list     = TagLib::ID3v1->genreList();
  my $genremap = TagLib::ID3v1->genreMap();

=head1 DESCRIPTION

=over

=item I<L<StringList|TagLib::StringList> genreList()> [static]

Returns the list of canonical ID3v1 genre names in the order that they
are listed in the standard.

=item I<L<Genremap|TagLib::ID3v1::GenreMap> genreMap()> [static]

A "reverse mapping" that goes from the canonical ID3v1 genre name to
the respective genre number.

=item I<L<String|TagLib::String> genre(IV $index)> [static]

Returns the name of the genre at $index in the ID3v1 genre list. If
  $index is out of range -- less than zero or greater than 146 -- a
  null string will be returned.

=item I<IV genreIndex(L<String|TagLib::String> $name)> [static]

Returns the genre index for the (case sensitive) genre $name. If the
genre is not in the list 255 (which signifies an unknown genre in
ID3v1) will be returned.

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
