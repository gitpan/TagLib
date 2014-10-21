# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as 
# `perl TagLib_Ogg_FieldListMap.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

#use Test::More q(no_plan);
use Test::More tests => 19;
BEGIN { use_ok('TagLib::Ogg::FieldListMap') };

#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

my @methods = qw(new DESTROY begin end insert clear size isEmpty find
contains erase getItem copy);
can_ok("TagLib::Ogg::FieldListMap", @methods) 					or 
	diag("can_ok failed");

my $i = TagLib::Ogg::FieldListMap->new();
isa_ok($i, "TagLib::Ogg::FieldListMap") 						or 
	diag("method new() failed");
isa_ok(TagLib::Ogg::FieldListMap->new($i), 
	"TagLib::Ogg::FieldListMap") 								or 
	diag("method new(map) failed");
SKIP: {
skip "copy(m) skipped", 0
	 if 1;
}

isa_ok($i->begin(), "TagLib::Ogg::FieldListMap::Iterator") 		or 
	diag("method begin() failed");
isa_ok($i->end(), "TagLib::Ogg::FieldListMap::Iterator") 		or 
	diag("method end() failed");
my $item = TagLib::StringList->new();
$item->append(TagLib::String->new("item1"));
$item->append(TagLib::String->new("item2"));
my $key = TagLib::String->new("key");
$i->insert($key, $item);
isa_ok($i->find($key), "TagLib::Ogg::FieldListMap::Iterator") 	or 
	diag("method find(key) failed");
cmp_ok($i->size(), "==", 1) 									or 
	diag("method insert(key, item) and size() failed");
$i->clear();
cmp_ok($i->size(), "==", 0) 									or 
	diag("method clear() failed");
ok($i->isEmpty()) 												or 
	diag("method isEmpty() failed");
$i->insert($key, $item);
ok($i->contains($key)) 											or 
	diag("method contains(key) failed");
$i->erase($key);
ok(not $i->contains($key)) 										or 
	diag("method erase(key) failed");
$i->insert($key, $item);
like($i->getItem($key)->toString()->toCString(), 
	qr/^item1.*?item2$/) or diag("method getItem(key) failed");
################################################################
# NOW START TO TEST TIE MAGIC
################################################################
$i->clear();
tie my %i, ref $i, $i;
isa_ok(tied %i, "TagLib::Ogg::FieldListMap") 					or 
	diag("method TIEHASH failed");
$i{$key} = $item;
like($i{$key}->toString()->toCString(), 
	qr/^item1.*?item2$/) 										or 
	diag("method FETCH and STORE failed");
%i = ();
cmp_ok(scalar(%i), "==", 0) 									or 
	diag("method CLEAR and SCALAR failed");
$i{$key} = $item;
ok(exists $i{$key}) 											or 
	diag("method EXISTS failed");
my @keys = keys %i;
cmp_ok($#keys+1, "==", scalar(%i)) 								or 
	diag("method FIRSTKEY and NEXTKEY failed");
{ no warnings q(untie); untie %i; }
ok(not %i) 														or 
	diag("method UNTIE failed");
