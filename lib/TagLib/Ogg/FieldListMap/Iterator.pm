package TagLib::Ogg::FieldListMap::Iterator;

use 5.008003;
use strict;
use warnings;

our $VERSION = '1.4';

use TagLib;

use overload
  q(${}) => sub { my $data = shift->data(); \$data;},
  q(=)   => sub { __PACKAGE__->new($_[0]); },
  q(++)  => sub { shift->next();},
  q(--)  => sub { shift->last();};

#  q(+=)  => sub { shift->forward($_[0]);},
#  q(-=)  => sub { shift->backward($_[0]);};

# Preloaded methods go here.

1;
__END__
# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

TagLib::Ogg::FiledListMap::Iterator - Perl-only class

=head1 SYNOPSIS

  use TagLib::Ogg::FiledListMap::Iterator;
  
  my $xc = TagLib::Ogg::XiphComment->new();
  $xc->setTitle(TagLib::String->new("title"));
  $xc->setArtist(TagLib::String->new("artist"));
  my $m  = $xc->fieldListMap();
  my $i  = $m->begin();
  print $$i->toString()->toCString(), "\n"; # got "artist"

=head1 DESCRIPTION

Implements C++ std::map::iterator to be corporately used with
L<FiledListMap|TagLib::Ogg::FiledListMap>.

=over

=item I<new()>

Generates an iterator attached with no map.

=item I<new(L<Iterator|TagLib::Ogg::FiledListMap::Iterator> $it)>

Copy constructor.

=item I<DESTROY()>

Deletes the instance.

=item I<L<Item|TagLib::APE::Item> data()>

Returns the L<Item|TagLib::APE::Item> pointed by current iterator.

overloaded by operator q(${})

=item I<L<Iterator|TagLib::Ogg::FiledListMap::Iterator> next()>

Moves to next item.

overloaded by operator q(++)

=item I<L<Iterator|TagLib::Ogg::FiledListMap::Iterator> last()>

Moves to last item.

overloaded by operator q(--)

=item I<void copy(L<Iterator|TagLib::Ogg::FiledListMap::Iterator> $it)>

Makes a copy of $it.


=back

=head2 OVERLOADED OPERATORS

B<${} = ++ -->


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
