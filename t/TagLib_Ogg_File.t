# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as 
# `perl TagLib_Ogg_File.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

#use Test::More q(no_plan);
use Test::More tests => 5;
BEGIN { use_ok('TagLib::Ogg::File') };

#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

my @methods = qw(DESTROY packet setPacket firstPageHeader
lastPageHeader name tag audioProperties save
readBlock writeBlock find rfind insert removeBlock readOnly isOpen
isValid seek clear tell length );
can_ok("TagLib::Ogg::File", @methods) 							or 
	diag("can_ok failed");

my $file = "sample/Discontent.ogg";
my $flacfile = TagLib::Ogg::FLAC::File->new($file);
isa_ok($flacfile->packet(0), "TagLib::ByteVector") 				or 
	diag("method packet(i) failed");
SKIP: {
skip "skip setPacket(i, p) & save()", 0 if 1;
}
isa_ok($flacfile->firstPageHeader(), "TagLib::Ogg::PageHeader") or 
	diag("method firstPageHeader() failed");
isa_ok($flacfile->lastPageHeader(), "TagLib::Ogg::PageHeader") 	or 
	diag("method lastPageHeader() failed");
