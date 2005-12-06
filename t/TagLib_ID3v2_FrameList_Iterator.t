# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as 
# `perl TagLib_ID3v2_FrameList_Iterator.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

#use Test::More q(no_plan);
use Test::More tests => 8;
BEGIN { use_ok('TagLib::ID3v2::FrameList::Iterator') };

#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

my @methods = qw(new DESTROY data next last);
can_ok("TagLib::ID3v2::FrameList::Iterator", @methods) or 
	diag("can_ok failed");
my $tag = TagLib::ID3v2::Tag->new();
$tag->setTitle(TagLib::String->new("title"));
$tag->setArtist(TagLib::String->new("artist"));
$tag->setYear(1981);
my $list = $tag->frameList;
my $i = $list->begin();
isa_ok($i, "TagLib::ID3v2::FrameList::Iterator") 					or 
	diag("method TagLib::ID3v2::Tag::FrameList() failed");
isa_ok(TagLib::ID3v2::FrameList::Iterator->new(), 
	"TagLib::ID3v2::FrameList::Iterator") 							or 
	diag("method new() failed");
isa_ok(TagLib::ID3v2::FrameList::Iterator->new($i), 
	"TagLib::ID3v2::FrameList::Iterator") 							or 
	diag("method new(i) failed");

like($i->data()->render()->data(), qr/^TIT2.*?title$/) 				or 
	diag("method data() failed");
like($i->next()->data()->render()->data(), qr/^TPE1.*?artist$/) 	or 
	diag("method next() failed");
like((--$i)->data()->render()->data(), qr/^TIT2.*?title$/) 			or 
	diag("method last() failed");
