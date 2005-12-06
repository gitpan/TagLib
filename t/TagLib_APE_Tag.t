# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as 
# `perl TagLib_APE_Tag.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

#use Test::More q(no_plan);
use Test::More tests => 19;
BEGIN { use_ok('TagLib::APE::Tag') };

#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

my @methods = qw(new DESTROY render title artist album comment genre
year track setTitle setArtist setAlbum setComment setGenre setYear
setTrack footer itemListMap removeItem addValue setItem fileIdentifier);
can_ok("TagLib::APE::Tag", @methods) 			or 
	diag("can_ok failed");

my $i = TagLib::APE::Tag->new();
isa_ok($i, "TagLib::APE::Tag") 					or 
	diag("method new() failed");
SKIP: {
skip "current no test for new(file, tagOffset)", 1 if 1;
my $file = "dummy";
my $tagOffset = 0;
my $j = TagLib::APE::Tag->new(TagLib::File->new($file), $tagOffset);
isa_ok($j, "TagLib::APE::Tag") 					or 
	diag("method new(file, tagOffset) failed");
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

isa_ok($i->render(), "TagLib::ByteVector") 		or 
	diag("method render() failed");
isa_ok($i->footer(), "TagLib::APE::Footer") 	or 
	diag("method footer() failed");
my $map = $i->itemListMap();
tie my %map, ref $map, $map;
isa_ok(tied %map, "TagLib::APE::ItemListMap") 	or 
	diag("method itemListMap() failed");
cmp_ok(scalar(%map), "==", 7) 					or 
	diag("method itemListMap() failed");
$i->removeItem(TagLib::String->new("TITLE"));
cmp_ok(scalar(%map), "==", 6) 					or 
	diag("method removeItem(key) failed");
$i->addValue(TagLib::String->new("TITLE"),
	TagLib::String->new("Title"));
is($map{TagLib::String->new("TITLE")}->
	toString()->toCString(), "Title") 			or 
	diag("method addValue(key, value) failed");
################################################################
# setItem will NOT replaced the old value of key
################################################################
$i->removeItem(TagLib::String->new("ARTIST"));
$i->setItem(TagLib::String->new("ARTIST"), 
	TagLib::APE::Item->new(TagLib::String->new("1"), 
	TagLib::String->new("Bon Jovi")));
is($map{TagLib::String->new("ARTIST")}->toString()->toCString(), 
	"Bon Jovi") 								or 
	diag("method setItem(key, item) failed");
is(TagLib::APE::Tag->fileIdentifier()->data(), "APETAGEX") or 
	diag("method fileIdentifier() failed");
