# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as 
# `perl TagLib_String_Iterator.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

#use Test::More q(no_plan);
use Test::More tests => 19;
BEGIN { use_ok('TagLib::String::Iterator') };

#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

my @methods = qw(new DESTROY data next last forward backward);
can_ok("TagLib::String::Iterator", @methods) or diag("can_ok failed");

my $data = "\x{6211}\x{7684}" x 2;
my $v = TagLib::String->new($data);
my $i = $v->begin();
isa_ok($i, "TagLib::String::Iterator") 							or 
	diag("method TagLib::String::begin() failed");
isa_ok(TagLib::String::Iterator->new(), 
	"TagLib::String::Iterator") 								or 
	diag("method new() failed");
isa_ok(TagLib::String::Iterator->new($i), 
	"TagLib::String::Iterator") 								or 
	diag("method new(i) failed");

is($i->data(), "\x{6211}") 			or 
	diag("method data() failed");
is($$i, "\x{6211}") 				or 
	diag("method data() failed");
$i->next();
is($i->data(), "\x{7684}") 			or 
	diag("method next() failed");
is((++$i)->data(), "\x{6211}") 		or 
	diag("operator++ failed");
is(($i++)->data(), "\x{6211}") 		or 
	diag("operator++(int) and operator = failed");
is($i->data(), "\x{7684}") 			or 
	diag("operator++(int) failed");
$i->last();
is($i->data(), "\x{6211}") 			or 
	diag("method last() failed");
is((--$i)->data(), "\x{7684}") 		or 
	diag("operator-- failed");
is(($i--)->data(), "\x{7684}") 		or 
	diag("operator--(int) and operator = failed");
is($i->data(), "\x{6211}") 			or 
	diag("operator--(int) failed");
$i->forward(1);
is($i->data(), "\x{7684}") 			or 
	diag("method forward(n) failed");
is(($i += 1)->data(), "\x{6211}") 	or 
	diag("operator+= failed");
$i->backward(1);
is($i->data(), "\x{7684}") 			or 
	diag("method backward(n) failed");
is(($i -= 1)->data(), "\x{6211}") 	or 
	diag("operator-= failed");
