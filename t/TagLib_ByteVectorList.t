# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as 
# `perl TagLib_ByteVectorList.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use Test::More q(no_plan);
#use Test::More tests => 5;
BEGIN { use_ok('TagLib::ByteVectorList') };

#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

my @methods = qw(new DESTROY toByteVector split);
can_ok("TagLib::ByteVectorList", @methods)		or 
	diag("can_ok failed");

my $i = TagLib::ByteVectorList->new();
my $j = TagLib::ByteVectorList->new($i);
isa_ok($i, "TagLib::ByteVectorList")			or 
	diag("method new() failed");
isa_ok($j, "TagLib::ByteVectorList") 			or 
	diag("method new(l) failed");

ok($i->toByteVector()->isEmpty()) 				or 
	diag("method toByteVector() failed");
my $v = TagLib::ByteVector->new("This is a test");
my $pattern = TagLib::ByteVector->new(" ");
my $k1 = TagLib::ByteVectorList->split($v, $pattern);
is($k1->toByteVector->data(), "This is a test") or 
	diag("method split(v, pattern) failed");