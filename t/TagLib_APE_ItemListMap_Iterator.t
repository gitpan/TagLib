# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as 
# `perl TagLib_APE_ItemListMap_Iterator.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

#use Test::More q(no_plan);
use Test::More tests => 8;
BEGIN { use_ok('TagLib::APE::ItemListMap::Iterator') };

#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

my @methods = qw(new DESTROY data next last);
can_ok("TagLib::APE::ItemListMap::Iterator", @methods) or diag("can_ok failed");
my $apetag = TagLib::APE::Tag->new();
$apetag->setTitle(TagLib::String->new("title"));
$apetag->setArtist(TagLib::String->new("artist"));
$apetag->setYear(1981);
my $map = $apetag->itemListMap();
my $i = $map->begin();
isa_ok($i, "TagLib::APE::ItemListMap::Iterator") 					or 
	diag("method TagLib::APE::Tag::itemListMap() failed");
isa_ok(TagLib::APE::ItemListMap::Iterator->new(), 
	"TagLib::APE::ItemListMap::Iterator") 							or 
	diag("method new() failed");
isa_ok(TagLib::APE::ItemListMap::Iterator->new($i), 
	"TagLib::APE::ItemListMap::Iterator") 							or 
	diag("method new(i) failed");

is($i->data()->toString()->toCString(), "artist") 					or 
	diag("method data() failed");
is($i->next()->data()->toString()->toCString(), "title") 			or 
	diag("method next() failed");
is((--$i)->data()->toString()->toCString(), "artist") 				or 
	diag("method last() failed");
