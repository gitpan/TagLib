# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as 
# `perl TagLib_ID3v2_FrameList.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

#use Test::More q(no_plan);
use Test::More tests => 31;
BEGIN { use_ok('TagLib::ID3v2::FrameList') };

#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

my @methods = qw(new DESTROY begin end insert sortedInsert append
prepend clear size isEmpty find contains erase front back
setAutoDelete getItem copy equals);
can_ok("TagLib::ID3v2::FrameList", @methods) 					or 
	diag("can_ok failed");

my $i = TagLib::ID3v2::FrameList->new();
isa_ok($i, "TagLib::ID3v2::FrameList")							or 
	diag("method new() failed");
isa_ok(TagLib::ID3v2::FrameList->new($i), 
	"TagLib::ID3v2::FrameList") 								or 
	diag("method new(framelist) failed");
SKIP: {
skip "copy(m) skipped", 0
	 if 1;
}

isa_ok($i->begin(), "TagLib::ID3v2::FrameList::Iterator") 		or 
	diag("method begin() failed");
isa_ok($i->end(), "TagLib::ID3v2::FrameList::Iterator") 		or 
	diag("method end() failed");
my $tag = TagLib::ID3v2::Tag->new();
$tag->setTitle(TagLib::String->new("title"));
$tag->setArtist(TagLib::String->new("artist"));
$tag->setAlbum(TagLib::String->new("album"));
$tag->setComment(TagLib::String->new("comment"));
$tag->setGenre(TagLib::String->new("genre"));
$tag->setYear(1981);
$tag->setTrack(3);
my $j = $tag->frameList();
$i->insert($i->end(), $j->front());
like($i->front()->render()->data(), qr/^TIT2.*?title$/) 		or 
	diag("method insert(it, item) & front() failed");
like($i->back()->render()->data(), qr/^TIT2.*?title$/) 			or 
	diag("method back() failed");
$i->sortedInsert($j->getItem(1));
like($i->getItem(1)->render()->data(), qr/^TPE1.*?artist$/) 	or 
	diag("method sortedInsert(item) and getItem(i) failed");
$i->append($j->getItem(2));
like($i->back()->render()->data(), qr/^TALB.*?album$/) 			or 
	diag("method append(item) failed");
$i->prepend($j->getItem(3));
like($i->front()->render()->data(), qr/COMM.*?comment$/) 		or 
	diag("method prepend(item) failed");
$i->clear();
cmp_ok($i->size(), "==", 0) 									or 
	diag("method clear() and size() failed");
ok($i->isEmpty()) 												or 
	diag("method isEmpty() failed");
$i->sortedInsert($j->front());
like($i->find($j->front())->data()->render()->data(), qr/^TIT2.*?title$/) 
	or diag("method find(key) failed");
ok($i->contains($j->front())) 									or 
	diag("method contains(key) failed");
$i->erase($i->find($j->front()));
ok(not $i->contains($j->front())) 								or 
	diag("method erase(key) failed");
ok(not $i->equals($j)) 											or 
	diag("method equals(obj) failed");
################################################################
# NOW START TO TEST TIE MAGIC
################################################################
tie my @i, ref($i), $i;
isa_ok(tied @i, "TagLib::ID3v2::FrameList") 					or 
	diag("method TIEARRAY failed");
$i[0] = $j->front();
like($i[0]->render()->data(), qr/^TIT2.*?title$/) 				or 
	diag("method FETCH and STORE failed");
cmp_ok($#i+1, "==", $i->size()) 								or 
	diag("method FETCHSIZE failed");
SKIP: {
skip "skip STORESIZE & EXTEND", 0 if 1;
}
ok(exists($i[0])) 												or 
	diag("method EXISTS failed");
ok(not exists($i[10])) 											or 
	diag("method EXISTS failed");
delete($i[0]);
ok(not exists($i[0])) 											or 
	diag("method DELETE failed");
$i[0] = $j->front();
@i = ();
cmp_ok(scalar(@i), "==", 0) 									or 
	diag("method CLEAR failed");
push(@i, $j->front());
like($i[0]->render()->data(), qr/^TIT2.*?title$/) 				or 
	diag("method PUSH failed");
like((pop @i)->render()->data(), qr/^TIT2.*?title$/) 			or 
	diag("method POP failed");
unshift @i, $j->front();
like($i[0]->render()->data(), qr/^TIT2.*?title$/) 				or 
	diag("method UNSHIFT failed");
like((shift @i)->render()->data(), qr/^TIT2.*?title$/) 			or 
	diag("method SHIFT failed");
splice @i, 0, 0, $j->front(), $j->back();
cmp_ok(scalar(@i), "==", 2) 									or 
	diag("method SPLICE failed");
my ($first, $second) = splice @i, 0, 2;
like($first->render()->data(), qr/^TIT2.*?title$/) 				or 
	diag("method SPLICE failed");
like($second->render()->data(), qr/^TRCK.*?3$/) 				or 
	diag("method SPLICE failed");