package TagLib::ID3v2::CommentsFrame;

use 5.008003;
use strict;
use warnings;

our $VERSION = '1.4';

use TagLib;

our @ISA = qw(TagLib::ID3v2::Frame);

# Preloaded methods go here.

1;
__END__
# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

TagLib::ID3v2::CommentsFrame - An implementation of ID3v2 comments

=head1 SYNOPSIS

  use TagLib::ID3v2::CommentsFrame;
  
  my $i = TagLib::ID3v2::CommentsFrame->new("Latin1");
  $i->setText(TagLib::String->new("blah blah blah"));

=head1 DESCRIPTION

This implements the ID3v2 comment format. An ID3v2 comment concists of
a language encoding, a description and a single text field.

=over

=item I<new(PV $encoding = "Latin1")>

Construct an empty comment frame that will use the text encoding
$encoding. 

=item I<new(L<ByteVector|TagLib::ByteVector> $data)>

Construct a comment based on the data in $data.

=item I<DESTROY()>

Destroys this CommentFrame instance.

=item I<L<String|TagLib::String> toString()>

Returns the text of this comment.

see I<text()>

=item I<L<ByteVector|TagLib::ByteVector> language()>

Returns the language encoding as a 3 byte encoding as specified by
ISO-639-2 F<http://en.wikipedia.org/wiki/ISO_639>

B<NOTE> Most taggers simply ignore this value.

see I<setLanguage()>

=item I<L<String|TagLib::String> description()>

Returns the description of this comment.

B<NOTE> Most taggers simply ignore this value.

see I<setDescription()>

=item I<L<String|TagLib::String> text()>

Returns the text of this comment.

see I<setText()>

=item I<void setLanguage(L<ByteVector|TagLib::ByteVector>
$languageCode)>

Set the language using the 3 byte language code from ISO-639-2
F<http://en.wikipedia.org/wiki/ISO_639> to $languageCode.

see I<language()>

=item I<void setDescripton(L<String|TagLib::String> $s)>

Sets the description of the comment to $s.

see I<description()>

=item I<void setText(L<String|TagLib::String> $s)>

Sets the text portion of the comment to $s.

see I<text()>

=item I<PV textEncoding()>

Returns the text encoding that will be used in rendering this
  frame. This defaults to the type that was either specified in the
  constructor or read from the frame when parsed. 

see I<setTextEncoding()>

see I<render()>

=item I<void setTextEncoding(PV $encoding)>

Sets the text encoding to be used when rendering this frame to
$encoding. 

see I<textEncoding()>

see I<render()>

=back

=head2 EXPORT

None by default.



=head1 SEE ALSO

L<TagLib|TagLib> L<Frame|TagLib::ID3v2::Frame>

=head1 AUTHOR

Dongxu Ma, E<lt>dongxu.ma@gmail.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2005 by Dongxu Ma

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.8.7 or,
at your option, any later version of Perl 5 you may have available.


=cut
