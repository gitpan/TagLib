package TagLib::APE::Footer;

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

TagLib::APE::Footer - An implementation of APE footers

=head1 SYNOPSIS

  use TagLib::APE::Footer;
  
  my $i = TagLib::APE::Footer->new();
  $i->setHeaderPresent(1) unless $i->headerPresent();

=head1 DESCRIPTION

This class implements APE footers (and headers). It attempts to
follow, both semantically and programatically, the structure specified
in the APE v2.0 standard.  The API is based on the properties of APE
footer and  headers specified there.

=over

=item I<new()>

Constructs an empty APE footer.

=item I<new(L<ByteVector|TagLib::ByteVector> $data)>

Constructs an APE footer based on $data.  parse() is called
immediately.

=item I<DESTROY()>

Destroys the footer.

=item I<UV version()>

Returns the version number. (Note: This is the 1000 or 2000.)

=item I<BOOL headerPresent()>

Returns true if a header is present in the tag.

=item I<BOOL footerPresent()>

Returns true if a footer is present in the tag.

=item I<BOOL isHeader()>

Returns true this is actually the header.

=item I<void setHeaderPresent(BOOL $b)>

Sets whether the header should be rendered or not.

=item I<UV itemCount()>

Returns the number of items in the tag.

=item I<void setItemCount(IV $s)>

Set the item count to $s.

see L<itemCount()>

=item I<UV tagSize()>

Returns the tag size in bytes.  This is the size of the frame content
  and footer.
 The size of the entire tag will be this plus the header size, if
  present.

see L<completeTagSize()>

=item I<UV completeTagSize()>

Returns the tag size, including if present, the header size.

see L<tagSize()>

=item I<void setTagSize(UV $s)>

Set the tag size to $s.

see L<tagSize()>

=item I<UV size()> [static]

Returns the size of the footer.  Presently this is always 32 bytes.

=item I<L<ByteVector|TagLib::ByteVector> fileIdentifier()> [static]

Returns the string used to identify an APE tag inside of a file. 
Presently this is always "APETAGEX".

=item I<void setData(L<ByteVector|TagLib::ByteVector> $data>

Sets the data that will be used as the footer. 32 bytes, starting from
$data will be used.

=item I<L<ByteVector|TagLib::ByteVector> renderFooter()>

Renders the footer back to binary format.

=item I<L<ByteVector|TagLib::ByteVector> renderHeader()>

Renders the header corresponding to the footer. If headerPresent is
  set to false, it returns an empty ByteVector.

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
