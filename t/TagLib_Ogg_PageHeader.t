# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as 
# `perl TagLib_Ogg_PageHeader.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

#use Test::More q(no_plan);
use Test::More tests => 16;
BEGIN { use_ok('TagLib::Ogg::PageHeader') };

#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

my @methods = qw(new DESTROY isValid packetSizes setPacketSizes
firstPacketContinued setFirstPacketContinued lastPacketCompleted
setLastPacketCompleted firstPageOfStream setFirstPageOfStream
lastPageOfStream setLastPageOfStream absoluteGranularPosition
setAbsoluteGranularPosition streamSerialNumber setStreamSerialNumber
pageSequenceNumber setPageSequenceNumber size dataSize render);
can_ok("TagLib::Ogg::PageHeader", @methods) 					or 
	diag("can_ok failed");

my $i = TagLib::Ogg::PageHeader->new();
isa_ok($i, "TagLib::Ogg::PageHeader") 							or 
	diag("method new() failed");

ok(not $i->isValid()) 											or 
	diag("method isValid() failed");
$i->setPacketSizes(1,2,3);
is($i->packetSizes(), "3") 										or 
	diag("method setPacketSizes(LIST<int>) and packetSizes() failed");
cmp_ok(scalar($i->packetSizes()), "==", 3) 						or 
	diag("method setPacketSizes(LIST<int>) and packetSizes() failed");
$i->setFirstPacketContinued(1);
ok($i->firstPacketContinued()) 									or 
	diag("method setFirstPacketContinued(b) and ".
	"firstPacketContinued() failed");
$i->setLastPacketCompleted(1);
ok($i->lastPacketCompleted()) 									or 
	diag("method setLastPacketCompleted(b) and lastPacketCompleted()".
	"failed");
$i->setFirstPageOfStream(1);
ok($i->firstPageOfStream()) 									or 
	diag("method setFirstPageOfStream(b) and firstPageOfStream() ".
	"failed");
$i->setLastPageOfStream(1);
ok($i->lastPageOfStream()) 										or 
	diag("method setLastPageOfStream(b) and lastPageOfStream() ".
	"failed");
$i->setAbsoluteGranularPosition(0xffff);
cmp_ok($i->absoluteGranularPosition(), "==", 0xffff) 			or 
	diag("method setAbsoluteGranularPosition(p) and ".
	"absoluteGranularPosition() failed");
$i->setStreamSerialNumber(3);
cmp_ok($i->streamSerialNumber(), "==", 3) 						or 
	diag("method setStreamSerialNumber(n) and streamSerialNumber()".
	"failed");
$i->setPageSequenceNumber(2);
cmp_ok($i->pageSequenceNumber(), "==", 2) 						or 
	diag("method setPageSequenceNumber(n) and pageSequenceNumber()".
	"failed");
cmp_ok($i->size(), "==", 0) 									or 
	diag("method size() failed");
cmp_ok($i->dataSize(), "==", 0) 								or 
	diag("method dataSize() failed");
like($i->render(), qr(\d{9})) 									or 
	diag("method render() failed");
