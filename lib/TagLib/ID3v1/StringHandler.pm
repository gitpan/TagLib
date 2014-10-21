package TagLib::ID3v1::StringHandler;

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

TagLib::ID3v1::StringHandler - A abstraction for the string to data
encoding in ID3v1 tags. 

=head1 DESCRIPTION

ID3v1 should in theory always contain ISO-8859-1 (Latin1) data. In
practise it does not. TagLib by default only supports ISO-8859-1 data
in ID3v1 tags.

However by subclassing this class and reimplementing parse() and
render() and setting your reimplementation as the default with
ID3v1::Tag::setStringHandler() you can define how you would like these
transformations to be done. 

B<WARNING> It is advisable B<NOT> to write non-ISO-8859-1 data to
ID3v1 tags. Please consider disabling the writing of ID3v1 tags in the
case that the data is ISO-8859-1.

see I<L<ID3v1::Tag::setStringHandler()|TagLib::ID3v1::Tag>>

=over

=item I<L<String|TagLib::String>
parse(L<ByteVector|TagLib::ByteVector> $data)> 

Decode a string from $data. The default implementation assumes that
$data is an ISO-8859-1 (Latin1) character array.

=item I<ByteVector|TagLib::ByteVector> render(L<String|TagLib::String>
$s)> 

Encode a ByteVector with the data from $s. The default implementation
assumes that $s is an ISO-8859-1 (Latin1) string.

B<WARNING> It is recommended that you B<NOT> override this method, but
instead do not write an ID3v1 tag in the case that the data is not
ISO-8859-1. 

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
