$VERSION = '0.9.6';

use ExtUtils::MakeMaker;

WriteMakefile(
    NAME         => "wptk",
    DISTNAME     => "wptk",
    EXE_FILES    => [ "wptk", "wptk.template" ],
    MAN3PODS     => {},
    PREREQ_PM    => {
        "Tk"         => '8.0.0',
    },
    VERSION_FROM => 'Makefile.PL',
    dist         => {COMPRESS => "gzip", SUFFIX => "gz"},
    ($] >= 5.005 ?
	(ABSTRACT => "windowing shell for Perl/Tk",
	 AUTHOR   => "Stephen O. Lidie (sol0@lehigh.edu)") : ()),
);

sub MY::post_initialize {

    use File::Basename;

    my ($config) = @_;

    my $perl = $config->{FULLPERL};
    my $root = dirname( $perl );
    system "$perl -ne 's\\WPTKROOT\\$root\\;s\\WPTKVERSION\\$VERSION\\; print' < wptk.c.template > wptk.c";
    die $@ if @$;

    return '';

}
