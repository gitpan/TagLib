use 5.008003;
use ExtUtils::MakeMaker;

BEGIN {
    # a simple work around to perform the neccessary pre-check
    # instead of overloading subs of MakeMaker or other wrapper
    print STDOUT "ONLY support TagLib version 1.4.* on Linux\n";
    require Carp;
    Carp::croak("currently only support Linux\n") 
      unless $^O = 'linux';
    our $libpath = qx(taglib-config --prefix);
    chomp($libpath);
    our $incpath = $libpath . "/include/taglib";
    $libpath .= "/lib";
    my ($lib) = glob($libpath . "/libtag.so.1.4.*");
    if (defined $lib) {
        print STDOUT "got $lib, good, go on\n";
    } else {
        Carp::croak("version 1.4.* not found,". 
                    "please install firstly\n");
    }
}

# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME              => 'TagLib',
    VERSION_FROM      => 'lib/TagLib.pm', # finds $VERSION
    PREREQ_PM         => {}, # e.g., Module::Name => 1.1
    ($] >= 5.005 ?     ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM  => 'lib/TagLib.pm', # retrieve abstract from module
       AUTHOR         => 'Dongxu, Ma <dongxu.ma@gmail.com>') : ()),
    CC                => 'g++',
    LD                => 'g++',
    LDDLFLAGS         => "-shared -L${libpath}",
    XSOPT             => '-C++ -hiertype',
    LIBS              => ['-ltag'], # e.g., '-lm'
    DEFINE            => '-DNO_DOXYGEN', # e.g., '-DHAVE_SOMETHING'
    INC               => "-I${incpath} -I/usr/include", # e.g., '-I. -I/usr/include/other'
	# Un-comment this if you add C files to link with later:
    # OBJECT            => '$(O_FILES)', # link all the C files too
);
