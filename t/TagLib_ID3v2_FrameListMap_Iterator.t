# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as 
# `perl TagLib_ID3v2_FrameListMap_Iterator.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

#use Test::More q(no_plan);
use Test::More tests => 8;
BEGIN { use_ok('TagLib::ID3v2::FrameListMap::Iterator') };

#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

my @methods = qw(new DESTROY data next last);
can_ok("TagLib::ID3v2::FrameListMap::Iterator", @methods) 			or 
	diag("can_ok failed");
my $tag = TagLib::ID3v2::Tag->new();
$tag->setTitle(TagLib::String->new("title"));
$tag->setArtist(TagLib::String->new("artist"));
$tag->setYear(1981);
my $item = $tag->frameList();
my $key = TagLib::ByteVector->new("key");
my $key2 = TagLib::ByteVector->new("key2");
my $map = TagLib::ID3v2::FrameListMap->new();
$map->insert($key, $item);
$map->insert($key2, $item);
my $i = $map->begin();
isa_ok($i, "TagLib::ID3v2::FrameListMap::Iterator") 				or 
	diag("method TagLib::ID3v2::Tag::frameListMap failed");
isa_ok(TagLib::ID3v2::FrameListMap::Iterator->new(), 
	"TagLib::ID3v2::FrameListMap::Iterator") 						or 
	diag("method new() failed");
isa_ok(TagLib::ID3v2::FrameListMap::Iterator->new($i), 
	"TagLib::ID3v2::FrameListMap::Iterator") 						or 
	diag("method new(i) failed");

like($i->data()->begin()->data()->render()->data(), 
	qr/^TIT2.*?title$/) or diag("method data() failed");
like($i->next()->data()->begin()->data()->render()->data(), 
	qr/^TIT2.*?title$/) or diag("method next() failed");
like((--$i)->data()->begin()->data()->render()->data(), 
	qr/^TIT2.*?title$/) or diag("method last() failed");
