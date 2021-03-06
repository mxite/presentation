use strict;
use warnings;
use 5.010;
use utf8;
use open qw/:std :utf8/;

use Git::Repository;
use File::Slurp qw( :edit );
my $url = 'https://github.com/mishin/perldoc-ru.git';
my $dir = '/home/mishin/github/test_repo';

#Git::Repository->run( clone => $url => $dir );
my $r = Git::Repository->new( work_tree => $dir );

use DateTime;
use DateTime::Format::Strptime;

my $dt = DateTime->new(
    year       => 2015,
    month      => 02,
    day        => 07,
    hour       => 16,
    minute     => 12,
    second     => 47,
    nanosecond => 500000000,
    time_zone  => 'Europe/Moscow',
);

#'Fri Jul 26 19:34:15 2013 +0200';
my $formatter =
  DateTime::Format::Strptime->new( pattern => '%a %b %d %H:%M %Y %z' );

$dt->set_formatter($formatter);
my $n = 1;

for ( 1 .. 50 ) {

    #inplace edit
    edit_file { s/__NUMBER\d+__/__NUMBER${n}__/ }
    $dir . '/pod2-ru/POD2-RU/scripts/get_pod_one_liners.md';
    say "iteration №${n}";
    say 'edit ok';
    $r->run( add => '.' );
    say 'add ok';
    my $date = $dt->_stringify();
    $r->run( commit => '-m', "my $n commit message", "--date=$date" );
    say 'commit ok';
    $dt->add( days => 1 );
    $n++;
}

#git remote set-url origin git@github.com:mishin/perldoc-ru.git
#git commit --amend --date="Sat Jan 10 14:00 2015 +0300"
#my $cmd = $r->command( commit => "--amend", "--date=$date");#, { fatal => 1 }
#say 'amend ok';
#my @errput = $cmd->stderr->getlines();
#say "ERROR: @errput";
#$cmd->close;

#http://www.dagolden.com/index.php/998/how-to-script-git-with-perl-and-gitwrapper/
#
#
#http://blogs.perl.org/users/preaction/2012/10/chicagopm-report---scripting-git-with-perl.html
#
#https://metacpan.org/pod/release/BOOK/Git-Repository-1.311/lib/Git/Repository/Tutorial.pod
#
#http://habrahabr.ru/post/201922/
#
#http://stackoverflow.com/questions/5188320/how-can-i-get-a-list-of-git-branches-ordered-by-most-recent-commit
#https://git.wiki.kernel.org/index.php/ExampleScripts

