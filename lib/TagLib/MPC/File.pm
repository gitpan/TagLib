package TagLib::MPC::File;

use 5.008003;
use strict;
use warnings;

our $VERSION = '1.4';

use TagLib;

our %_TagTypes = (
    "NoTags"  => "0x0000",
    "ID3v1"   => "0x0001",
    "ID3v2"   => "0x0002",
    "APE"     => "0x0004",
    "AllTags" => "0xffff",
);

our @ISA = qw(TagLib::File);

# Preloaded methods go here.

1;
__END__
# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

TagLib::MPC::File - An implementation of TagLib::File with MPC
specific methods 

=head1 SYNOPSIS

  use TagLib;
  
  my $i = TagLib::MPC::File->new("sample mpc file.mpc");
  print $i->tag()->title()->toCString(), "\n"; # got title

=head1 DESCRIPTION

This implements and provides an interface for MPC files to the
TagLib::Tag and TagLib::AudioProperties interfaces by way of
implementing the abstract TagLib::File API as well as providing some
additional information specific to MPC files.

The only invalid tag combination supported is an ID3v1 tag after an
APE tag. 

=over

=item I<new(PV $file, BOOL $readProperties = TRUE, PV $propertiesStyle
= "Average")>

Constructs an MPC file from $file. If $readProperties is true the
file's audio properties will also be read using $propertiesStyle. If
false, $propertiesStyle is ignored.

=item I<DESTROY()>

Destroys this instance of the File.

=item I<L<Tag|TagLib::Tag> tag()>

Returns the Tag for this file.  This will be an APE tag, an ID3v1 tag
or a combination of the two.

=item I<L<Properties|TagLib::MPC::Properties> audioProperties()>

Returns the MPC::Properties for this file. If no audio properties were
read then this will return undef.

=item I<BOOL save()>

Save the file.

=item I<L<ID3v1::Tag|TagLib::ID3v1::Tag> ID3v1Tag(BOOL $create =
FALSE)>

Returns the ID3v1 tag of the file.

If $create is false (the default) this will return undef if there is
 no valid ID3v1 tag. If $create is true it will create an ID3v1 tag if
 one does not exist. If there is already an APE tag, the new ID3v1 tag
 will be placed after it.

 B<NOTE> The Tag is B<STILL> owned by the APE::File and should not be
 deleted by the user. It will be deleted when the file (object) is
 destroyed. 

=item I<L<APE::Tag|TagLib::APE::Tag> APETag(BOOL $create = FALSE)>

Returns the APE tag of the file.

If $create is false (the default) this will return undef if there is
no valid APE tag. If $create is true it will create a APE tag if one
does not exist. If there is already an ID3v1 tag, the new APE tag will
be placed before it.

B<NOTE> The Tag is B<STILL> owned by the APE::File and should not be
deleted by the user. It will be deleted when the file (object) is
destroyed. 

=item I<void remove(PV $tags = "ALLTags")>

This will remove the tag that matches TagTypes from the file. By
default it removes all tags.

B<NOTE> This will also invalidate pointers to the tags as their memory
will be freed.

B<NOTE> In order to make the removal permanent save() still needs to
be called. 

=item %_TagTypes

This set of flags is used for various operations. C<keys
%TagLib::MPC::File::_TagTypes> lists all available values used in Perl
code. 

B<WARNING> The values are not allowed to be OR-ed together in Perl.

=back

=head2 EXPORT

None by default.



=head1 SEE ALSO

L<TagLib|TagLib> L<File|TagLib::File>

=head1 AUTHOR

Dongxu Ma, E<lt>dongxu.ma@gmail.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2005 by Dongxu Ma

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.8.7 or,
at your option, any later version of Perl 5 you may have available.


=cut
