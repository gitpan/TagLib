package TagLib::APE::Item;

use 5.008003;
use strict;
use warnings;

our $VERSION = '1.4';

use TagLib;

our %_ItemTypes = (
    "Text"    => 0,
    "Binary"  => 1,
    "Locator" => 2,
);

# Preloaded methods go here.
1;
__END__
# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

TagLib::APE::Item - An implementation of APE-items

=head1 SYNOPSIS

  use TagLib::APE::Item;
  
  my $key   = TagLib::String->new("key");
  my $value = TagLib::String->new("value");
  my $i     = TagLib::APE::Item->new($key, $value);
  $i->setType("Text");
  $i->setReadOnly(1) unless $i->isReadOnly();
  my $data  = $i->render();

=head1 DESCRIPTION

This class provides the features of items in the APEv2 standard.

=over

=item I<new()>

Constructs an empty item.

=item I<new(L<String|TagLib::String> $key, L<String|TagLib::String>
$value)> 

Constructs an item with $key and $value. 

=item I<new(L<String|TagLib::String> $key,
L<StringList|TagLib::StringList> $values)>

Constructs an item with $key and $values.

=item I<new(L<Item|TagLib::APE::Item> $item)>

Construct an item as a copy of $item.

=item I<DESTROY()>

Destroys the item.

=item I<copy(L<Item|TagLib::APE::Item> $item)>

Copies the contents of $item into this item.

=item I<L<String|TagLib::String> key()>

Returns the key.

=item I<L<ByteVector|TagLib::ByteVector> value()>

Returns the binary value.

=item I<IV size()>

Returns the size of the full item.

=item I<L<String|TagLib::String> toString()>

Returns the value as a single string. In case of multiple strings, the
first is returned.

=item I<L<StringList|TagLib::StringList> toStringList()>

Returns the value as a string list.

=item I<L<ByteVector|TagLib::ByteVector> render()>

Render the item to a ByteVector.

=item I<void parse(L<ByteVector|TagLib::ByteVector> $data)>

Parse the item from the ByteVector $data.

=item I<void setReadOnly(BOOL $b)>

Set the item to read-only.

=item I<BOOL isReadOnly()>

 Return true if the item is read-only.

=item I<void setType(PV $type)>

Sets the type of the item to $type.

see I<%_ItemTypes>

=item I<PV type()>

Returns the type of the item.

see I<%_ItemTypes>

=item I<BOOL isEmpty()>

Returns if the item has any real content.

=item %_ItemTypes

C<keys %TagLib::APE::Item::_ItemTypes> lists all available itemtypes
used in Perl. 

see I<L<setType>>

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
