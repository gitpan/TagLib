# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as 
# `perl TagLib_APE_ItemListMap.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

#use Test::More q(no_plan);
use Test::More tests => 19;
BEGIN { use_ok('TagLib::APE::ItemListMap') };

#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

my @methods = qw(new DESTROY begin end insert clear size isEmpty find
contains erase getItem copy);
can_ok("TagLib::APE::ItemListMap", @methods) 					or 
	diag("can_ok failed");

my $i = TagLib::APE::ItemListMap->new();
isa_ok($i, "TagLib::APE::ItemListMap") 							or 
	diag("method new() failed");
isa_ok(TagLib::APE::ItemListMap->new($i), 
	"TagLib::APE::ItemListMap") 								or 
	diag("method new(map) failed");

SKIP: {
skip "copy(m) skipped", 0
	 if 1;
}
isa_ok($i->begin(), "TagLib::APE::ItemListMap::Iterator") 		or 
	diag("method begin() failed");
isa_ok($i->end(), "TagLib::APE::ItemListMap::Iterator") 		or 
	diag("method end() failed");
my $key = TagLib::String->new("key");
my $value = TagLib::String->new("value");
my $item = TagLib::APE::Item->new($key, $value);
isa_ok($i->find($key), "TagLib::APE::ItemListMap::Iterator") 	or 
	diag("method find(key) failed");
$i->insert($key, $item);
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
is($i->getItem($key)->toString()->toCString(), "value") 		or 
	diag("method getItem(key) failed");
################################################################
# NOW START TO TEST TIE MAGIC
################################################################
tie my %j, "TagLib::APE::ItemListMap", $i;
isa_ok(tied %j, "TagLib::APE::ItemListMap") 					or 
	diag("method TIEHASH failed");
$j{$key} = $item;
is($j{$key}->toString()->toCString(), "value") 					or 
	diag("method FETCH and STORE failed");
%j = ();
cmp_ok(scalar(%j), "==", 0) 									or 
	diag("method CLEAR and SCALAR failed");
$j{$key} = $item;
ok(exists $j{$key}) 											or 
	diag("method EXISTS failed");
my @keys = keys %j;
cmp_ok($#keys+1, "==", scalar(%j)) 								or 
	diag("method FIRSTKEY and NEXTKEY failed");
{ no warnings q(untie); untie %j; }
ok(not %j) 														or 
	diag("method UNTIE failed");
