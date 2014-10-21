# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as 
# `perl TagLib_ID3v2_CommentsFrame.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

#use Test::More q(no_plan);
use Test::More tests => 9;
BEGIN { use_ok('TagLib::ID3v2::CommentsFrame') };

#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

my @methods = qw(new DESTROY toString language description text
setLanguage setDescription setText textEncoding setTextEncoding
frameID size setData setText render headerSize textDelimiter);
can_ok("TagLib::ID3v2::CommentsFrame", @methods) 					or 
	diag("can_ok failed");

my $i = TagLib::ID3v2::CommentsFrame->new();
isa_ok($i, "TagLib::ID3v2::CommentsFrame") 							or 
	diag("method new() failed");
$i->setTextEncoding("UTF8");
isa_ok(TagLib::ID3v2::CommentsFrame->new($i->render()), 
	"TagLib::ID3v2::CommentsFrame") 								or 
	diag("method new(data) failed");

is($i->textEncoding(), "UTF8") 										or 
	diag("method setTextEncoding(encode) and textEncoding() failed");
$i->setLanguage(TagLib::ByteVector->new("1"));
is($i->language()->data(), "1") 									or 
	diag("method setLanuage(code) and language() failed");
$i->setText(TagLib::String->new("blah blah"));
is($i->text()->toCString(), "blah blah") 							or 
	diag("method setText(s) and text() failed");
$i->setDescription(TagLib::String->new("description"));
is($i->description()->toCString(), "description") 					or 
	diag("method setDescription(desc) and description() failed");
is($i->toString()->toCString(), "blah blah") 						or 
	diag("method toString() failed");
