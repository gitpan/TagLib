# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as 
# `perl TagLib_StringList.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

#use Test::More q(no_plan);
use Test::More tests => 9;
BEGIN { use_ok('TagLib::StringList') };

#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

my @methods = qw(new DESTROY toString append split);
can_ok("TagLib::StringList", @methods) 								or 
	diag("method can_ok failed");

my $i = TagLib::StringList->new();
ok($i->toString()->isEmpty()) 										or 
	diag("method new() failed");
my $j = TagLib::StringList->new(TagLib::String->new("blah blah"));
is($j->toString()->toCString(), "blah blah") 						or 
	diag("method new(String) failed");
my $k = TagLib::StringList->new($j);
is($k->toString()->toCString(), "blah blah") 						or 
	diag("method new(StringList) failed");
my $vl = TagLib::ByteVectorList->split(
	TagLib::ByteVector->new("blah blah"), TagLib::ByteVector->new(" "));
my $l = TagLib::StringList->new($vl);
is($l->toString(TagLib::String->new("_"))->toCString(), "blah_blah") 
	or diag("method new(ByteVectorList) failed");
my $m = $i->append($j);
is($m->toString()->toCString(), "blah blah") 						or 
	diag("method append(StringList) failed");
my $n = $m->append(TagLib::String->new("blah blah"));
is($n->toString()->toCString(), "blah blah blah blah") 				or 
	diag("method append(String) failed");
my $o = TagLib::StringList->split(
	TagLib::String->new("This is a test"), TagLib::String->new(" "));
is($o->toString(TagLib::String->new("_"))->toCString(), 
	"This_is_a_test") or diag("method split(string, pattern) failed");
