package TagLib::ID3v2::UserTextIdentificationFrame;

use 5.008003;
use strict;
use warnings;

our $VERSION = '1.4';

use TagLib;

our @ISA = qw(TagLib::ID3v2::TextIdentificationFrame);

# Preloaded methods go here.

1;
__END__
# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

TagLib::ID3v2::UserTextIdentificationFrame - An ID3v2 custom text
identification frame implementation

=head1 SYNOPSIS

  use TagLib::ID3v2::UserTextIdentificationFrame;
  
  my $i = TagLib::ID3v2::UserTextIdentificationFrame->new("Latin1");
  $i->setDescription(TagLib::String->new("blah blah"));
  print $i->description()->toCString(), "\n"; # got "blah blah"

=head1 DESCRIPTION

This is a specialization of text identification frames that allows for
user defined entries. Each entry has a description in addition to the
normal list of fields that a text identification frame has. 

This description identifies the frame and must be unique.

=over

=item I<new(PV $encoding = "Latin1")>

Constructs an empty user defined text identification frame. For this
to be a useful frame both a description and text must be set.

=item I<new(L<ByteVector|TagLib::ByteVector> $data)>

Creates a frame based on $data.

=item I<L<String|TagLib::String> description()>

Returns the description for this frame.

=item I<void setDescription(L<String|TagLib::String> $s)>

Sets the description of the frame to $s. $s must be unique. You can
 check for the presense of another user defined text frame of the same
 type using find() and testing for null.

=item I<L<StringList|TagLib::StringList> fieldList()>

=item I<void setText(L<String|TagLib::String> $text)>

=item I<void setText(L<StringList|TagLib::StringList> $fields)>

see
L<TagLib::ID3v2::TextIdentificationFrame|TagLib::ID3v2::TextIdentificationFrame> 

=item I<UserTextIdentificationFrame find(L<Tag|TagLib::ID3v2::Tag>
$tag, L<String|TagLib::String> $description)> [static]

Searches for the user defined text frame with the description
$description in $tag. This returns undef if no matching frame were
found. 

=back

=head2 EXPORT

None by default.



=head1 SEE ALSO

L<TagLib|TagLib> L<TextIdentificationFrame|TagLib::ID3v2::TextIdentificationFrame>

=head1 AUTHOR

Dongxu Ma, E<lt>dongxu.ma@gmail.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2005 by Dongxu Ma

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.8.7 or,
at your option, any later version of Perl 5 you may have available.


=cut
