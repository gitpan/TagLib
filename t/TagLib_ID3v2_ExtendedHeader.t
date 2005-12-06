# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as 
# `perl TagLib_ID3v2_ExtendedHeader.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

#use Test::More q(no_plan);
use Test::More tests => 4;
BEGIN { use_ok('TagLib::ID3v2::ExtendedHeader') };

#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

my @methods = qw(new DESTROY size setData);
can_ok("TagLib::ID3v2::ExtendedHeader", @methods) 					or 
	diag("can_ok failed");

my $i = TagLib::ID3v2::ExtendedHeader->new();
isa_ok($i, "TagLib::ID3v2::ExtendedHeader") 						or 
	diag("method new failed");
my $data = TagLib::ByteVector->new("blah blah");
$i->setData($data);
my $j = TagLib::ID3v2::ExtendedHeader->new();
$j->setData($data);
cmp_ok($i->size(), "==", $j->size()) 								or 
	diag("method setData(bytevector) or size() failed");
