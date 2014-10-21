# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as 
# `perl TagLib_Ogg_XiphComment.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

#use Test::More q(no_plan);
use Test::More tests => 19;
BEGIN { use_ok('TagLib::Ogg::XiphComment') };

#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

my @methods = qw(new DESTROY title artist album comment genre year
track setTitle setArtist setAlbum setComment setGenre setYear setTrack
isEmpty fieldCount fieldListMap vendorID addField removeField render);
can_ok("TagLib::Ogg::XiphComment", @methods) 		or 
	diag("can_ok failed");

my $i = TagLib::Ogg::XiphComment->new();
isa_ok($i, "TagLib::Ogg::XiphComment") 				or 
	diag("method new() failed");
SKIP: {
skip "current no test for new(data)", 1 if 1;
my $j = TagLib::Ogg::XiphComment->new(TagLib::ByteVector->new("blah blah"));
isa_ok($j, "TagLib::Ogg::XiphComment") 				or 
	diag("method new(data) failed");
}

$i->setTitle(TagLib::String->new("Title"));
is($i->title()->toCString(), "Title") 			or 
	diag("method setTitle(string) and title() failed");
$i->setArtist(TagLib::String->new("Artist"));
is($i->artist()->toCString(), "Artist") 		or 
	diag("method setArtist(string) and artist() failed");
$i->setAlbum(TagLib::String->new("Album"));
is($i->album()->toCString(), "Album") 			or 
	diag("method setAlbum(string) and album() failed");
$i->setComment(TagLib::String->new("Comment"));
is($i->comment()->toCString(), "Comment") 		or 
	diag("method setComment(string) and comment() failed");
$i->setGenre(TagLib::String->new("Genre"));
is($i->genre()->toCString(), "Genre") 			or 
	diag("method setGenre(string) and genre() failed");
$i->setYear(1981);
cmp_ok($i->year(), "==", 1981) 					or 
	diag("method setYear(uint) and year() failed");
$i->setTrack(3);
cmp_ok($i->track(), "==", 3) 					or 
	diag("method setTrack(uint) and track() failed");
ok(not $i->isEmpty()) 							or 
	diag("method isEmpty() failed");
cmp_ok($i->fieldCount(), "==", 7) 				or 
	diag("method fieldCount() failed");
isa_ok($i->fieldListMap(), "TagLib::Ogg::FieldListMap") 	or 
	diag("method fieldListMap() failed");
like($i->vendorID()->toCString(), qr(^)) 		or 
	diag("method vendorID() failed");
$i->addField(TagLib::String->new("TITLE"), 
	TagLib::String->new("newTitle"));
is($i->title()->toCString(), "newTitle") 		or
	diag("method addField(key, value) failed");
$i->removeField(TagLib::String->new("TITLE"));
cmp_ok($i->fieldCount(), "==", 6) 				or 
	diag("method removeField(key) failed");
cmp_ok($i->render()->size(), "==", 109) 		or 
	diag("method render() failed");
cmp_ok($i->render(1)->size(), "==", 109) 		or 
	diag("method render(addFramingBit) failed");
