use strict;
use warnings;

use File::Spec;
use lib File::Spec->catdir(File::Spec->curdir(), "inc");

use Test::Run::Builder;

my $builder = Test::Run::Builder->new(
    module_name         => 'Spork::Shlomify',
    license             => 'bsd',
    dist_author         => 'Shlomi Fish <shlomif@iglu.org.il>',
    dist_version_from   => 'lib/Spork/Shlomify.pm',
    requires => {
        'Test::More' => 0,
        'Spork' => 0,
    },
    add_to_cleanup      => [ 'Spork-Shlomify-*' ],
    script_files => [ "bin/shspork" ],
    create_makefile_pl => "traditional",
);

$builder->create_build_script();
