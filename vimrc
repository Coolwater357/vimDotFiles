" An example for a vimrc file.
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"             for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
" version 4.0		" avoid warning for wrong version
set guioptions+=mraitF
" set guioptions-=T
set cmdheight=2

"call pathogen#infect()

set visualbell
set bs=2		" allow backspacing over everything in insert mode
" set ai			" always set autoindenting on
" set tw=78		" always limit the width of text to 78
set backup		" keep a backup file
set viminfo='20,\"50	" read/write a .viminfo file, don't store more
			" than 50 lines of registers
set laststatus=2
set ruler

" set mouseshape=i:pencil 
set mouseshape=v:beam 
set mouseshape=vd:busy 

" The gvim program has a blinking cursor which wakes up things regularly. You can fix this by using
let &guicursor = &guicursor . ",a:blinkon0"

" ShowMarks plugin
let g:showmarks_enable=1

" When starting to edit a file:
"   For *.c and *.h files set formatting of comments and set C-indenting on
"   For other files switch it off
"   Don't change the sequence, it's important that the line with * comes first.
autocmd BufRead * set formatoptions=tcql nocindent comments&
autocmd BufRead *.C,*.h set formatoptions=croql cindent comments=sr:/*,mb:*,el:*/,://
autocmd BufRead *.pl,*.pm set formatoptions=croql cindent comments&
" remove trailing spaces from .pl file lines
" autocmd BufWritePre *.pl :%s/\s\+$//e 

" Enable editing of gzipped files
"    read: set binary mode before reading the file
"          uncompress text in buffer after reading
"   write: compress file after writing
"  append: uncompress file, append, compress file
" autocmd BufReadPre,FileReadPre      *.gz set bin
" autocmd BufReadPost,FileReadPost    *.gz '[,']!gunzip
" autocmd BufReadPost,FileReadPost    *.gz set nobin

" autocmd BufWritePost,FileWritePost  *.gz !mv <afile> <afile>:r
" autocmd BufWritePost,FileWritePost  *.gz !gzip <afile>:r

" autocmd FileAppendPre		    *.gz !gunzip <afile>
" autocmd FileAppendPre		    *.gz !mv <afile>:r <afile>
" autocmd FileAppendPost		    *.gz !mv <afile> <afile>:r
" autocmd FileAppendPost		    *.gz !gzip <afile>:r

" Add a dashed line under current line
nnoremap <Leader>H yyp^v$r-o<Esc>

" vnoremap <A-Insert> <C-C>`<v`>s<Space><Esc>mq:e ispell.tmp<CR>i<C-R>"<Esc>:w<CR>:! xterm -bg ivory -fn 10x20 -e ispell %<CR><CR>:e %<CR><CR>ggVG<Esc>`<v`>s<Esc>:bwipeout!<CR>:!rm ispell.tmp*<CR>`q"_s<C-R>"<Esc> 
noremap <S-Insert> :w<CR>:! xterm -bg ivory -fn 10x20 -e ispell %<CR><Space>:e %<CR><Space> 

set diffopt+=iwhite
set diffopt+=icase

"source ~/.vim/plugin/matchit.vim 
filetype plugin on 
filetype plugin indent on 
"source ~/.vim/plugin/taglist.vim
"let Tlist_Ctags_Cm=/usr/local/bin/ctags

" nmap <silent> <leader><leader> [{V%zf
" to hide arbitary block, use these key strokes: v<move>zf 
set foldminlines=3
set foldmethod=manual
nmap <silent> \\ [{V%zf
map - v%zf 
map `` /^sub<cr>/{<cr>-
" set foldmethod=marker
" nmap <silent> == [subV%zf
" my old .exrc file
" map # I/*$a*/j
map # : s.^.#.
map ! : s.^#..
map ) i(ea)
map K ^76lbiJ
map T ^150li
map Y yy
map U dwhi&printDataEntry('pa',lpa)
"map \ r bi(el
"map ` r bi(elx
" map q '[<cr>i"<esc>
map ' lbi'ea'
" map " i"lwi"l
" map " i"ea"
map _ :.w! >> vi.tmpj
map + :r vi.tmp
map <F2> :setlocal spell! spelllang=en_us<cr> 
" map <F3> :let do_syntax_sel_menu = 1\|runtime! synmenu.vim\|aunmenu &Syntax.&Show\\\ filetypes\\\ in\\\ menu
map <F3> :let do_syntax_sel_menu = 1|runtime! synmenu.vim
map <F4> :cal SetSyn("perl")<cr>
map <F5> :set hls!<cr>
map <F6> :cal SetSyn("pod")<cr>
map <F7> :set hls!<CR><Bar>:echo "HLSearch: " . strpart("OffOn", 3 * &hlsearch, 3)<CR>
map <F9> :cal SetSyn("verilog")<cr>
" map = :.w! >> vi.tmp
map { /{il
" * == search for text under cursor
" map * mz:1,$s.\/\*.{{.g:1,$s.\*\/.}}.g:'z%mz:1,$s.{{./*.g:1,$s.}}.*/.g:'z
map t ^i<td>A</td>j
ab  readfile my $inputFile = "abc";<cr>open(IN,"$inputFile") or die "Unable to read $inputFile because $!";<cr>while (<IN>)<cr>{<cr>    my $line = $_;<cr>    chomp $line;<cr>}<cr>close IN;
ab  readfile6 my $inputFile = "/user/schumack/.cshrc";<cr>my $fh = open $inputFile or die "Unable to read $inputFile because $!";<cr>for $fh.lines -> $line<cr>{<cr>say $line;<cr><BS><BS><BS><BS>}
ab svnrev #REV='@(#)$Id$ $Revision$ $URL$ $Author$ $Date$';<cr>
ab subsub #######<cr>sub x<cr>{<cr>}<cr>################################################################################
ab printdebug print STDERR $REVERSE_BLUE.DEBUG.basename(__FILE__).":".__LINE__."$COLOR_RESET " if ($debug);
ab saydebug say STDERR $REVERSE_BLUE.DEBUG.basename(__FILE__).":".__LINE__."$COLOR_RESET " if ($debug);

ab printdebugtime if ($debug) {print STDERR $REVERSE_BLUE.DEBUG.__LINE__.":".(Time::HiRes::time - $debugTime)."$COLOR_RESET "; $debugTime=Time::HiRes::time}
ab printfdebugtime if ($debug) {printf STDERR "%s%s%s:%s%s \n",(time - $debugTime)>0.1?$REVERSE_RED:$REVERSE_BLUE,DEBUG,__LINE__,(Time::HiRes::time - $debugTime),$COLOR_RESET; $debugTime=Time::HiRes::time}
ab printline print STDERR $REVERSE_BLUE.__LINE__." $COLOR_RESET ";
ab sayline say STDERR $REVERSE_BLUE.__LINE__." $COLOR_RESET ";
ab saytime say STDERR $REVERSE_BLUE.__LINE__." $COLOR_RESET time=".time;

ab printfileline print STDERR basename(__FILE__).':'.__LINE__." ";
ab sayfileline say STDERR basename(__FILE__).':'.__LINE__." ";
ab printfilelinec print STDERR $REVERSE_BLUE.__FILE__.':'.__LINE__."$COLOR_RESET ";

ab printerror print STDERR $REVERSE_RED.ERROR."$COLOR_RESET ";
ab sayerror say STDERR $REVERSE_RED.ERROR."$COLOR_RESET ";

ab printwarning print STDERR $REVERSE_YELLOW.WARNING."$COLOR_RESET ";
ab saywarning say STDERR $REVERSE_YELLOW.WARNING."$COLOR_RESET ";
ab sayKVS say STDERR $REVERSE_YELLOW.__LINE__."KVS$COLOR_RESET " if ($KVS);

ab printinfo print STDERR $REVERSE_CYAN.INFO."$COLOR_RESET ";
ab sayinfo say STDERR $REVERSE_CYAN.INFO."$COLOR_RESET ";

ab printverbose print STDERR $REVERSE_CYAN.INFO."$COLOR_RESET " if ($verbose);
ab sayverbose say STDERR $REVERSE_CYAN.INFO."$COLOR_RESET " if ($verbose);

ab printnote print STDERR $REVERSE_MAGENTA.NOTE."$COLOR_RESET ";
ab saynote say STDERR $REVERSE_MAGENTA.NOTE."$COLOR_RESET ";

ab newfh use FileHandle;<cr>my $fhOut = new FileHandle;<cr>open($fhOut,">$outputFile");<cr>$fhOut -> close;
ab starthaskell module Main where<cr>import IO<cr>main = do<cr>    
ab usagetracker if (open(USAGE,">>$ichome/data/Usage/$PROGRAMNAME"))<cr>{<cr>my $userName = getpwuid($<); my $hostName = hostname();<cr>print USAGE strftime("%Y-%m-%dT%H:%M:%S", localtime)." $userName $hostName ".cwd()." $REVSTAMP";    <cr>close USAGE;<cr>chmod oct('0666'),"$ichome/data/Usage/$PROGRAMNAME";<cr>}
ab startv module name;<cr>  initial begin<cr>    $display("hello");<cr>  end<cr>endmodule
ab magicheader #! /bin/sh --<cr>eval '(exit $?0)' && eval 'PERL_BADLANG=x;PATH="/user/ic/gnu/`uname -s`/bin:$PATH";export PERL_BADLANG;: \<cr>;exec perl -x -S -- "$0" ${1+"$@"};#'if 0;<cr>exec 'setenv PERL_BADLANG x;exec perl -x -S -- "$0" $argv:q;#'.q<cr>#!/user/ic/gnu/`uname -s`/bin/perl -w<cr>+($0=~/(.*)/s);do(index($1,"/")<0?"./$1":$1);die$@if$@;__END__+if 0;<cr># Above is magic header ... real Perl code begins here<cr>#REV='@(#)$Id$ $Revision$ $Date$ subversion icrepo';<cr>
ab startpython #!/usr/bin/python<cr>import os<cr>import sys<cr>
ab startjava public class AAA<cr>{<cr>public static void main(String[] args)<cr>{<cr>}<cr>}

ab startperl6 #!/usr/local/bin/perl6<cr><BS>use v6;<cr><cr>our $VERSION = sprintf("%s", q$Revision: 12082 $ ~~ m/(\d+)/); ##subversion compatible<cr>our $REVDATE = sprintf("%s", q$Date: 2013-05-30 15:46:03 -0500 (Thu, 30 May 2013) $ ~~ m/\d(<digit>+\|\|\-\|\|\s\|\:)+/);<cr>our $PROGRAMNAME = sprintf("%s", q$Id: perlprogram.pl6 12082 2013-05-23 21:06:19Z schumack $ ~~ m/(\w+)(\.\|\|\s)\w/); $PROGRAMNAME=$0;<cr>our $REVSTAMP = "$VERSION:$REVDATE"; $REVSTAMP ~~ s/\s/T/; $REVSTAMP ~~ s/\s.*//;<cr>our $ichome;<cr>sub MAIN($x, $y) <cr>{<cr>say $x + $y;<cr>}<cr>sub USAGE()<cr>{<cr>say "Usage: add.pl <num1> <num2>";<cr>}<cr>

ab startperl #! /bin/sh --<cr><BS>eval '(exit $?0)' && eval 'PERL_BADLANG=x;PATH="/user/ic/gnu/`uname -s`-`uname -m`/bin:/user/ic/gnu/`uname -s`/bin:$PATH";export PERL_BADLANG;: \<cr>;exec perl -x -S -- "$0" ${1+"$@"};#'if 0;<cr>exec 'setenv PERL_BADLANG x;exec perl -x -S -- "$0" $argv:q;#'.q<cr>#!/bin/perl -w<cr><BS>+($0=~/(.*)/s);do(index($1,"/")<0?"./$1":$1);die$@if$@;__END__+if 0;<cr># Above is magic header ... real Perl code begins here<cr><BS>#REV='@(#)$Id$ $Revision$ $Date$ subversion icrepo';<cr><BS>use strict;<cr>require 5.020;<cr>use warnings;<cr>our $VERSION = "0.1alpha";<cr>our $REVISION = sprintf("%s", q$Revision: 1 $ =~ m/(\d[\.\d]*)/); ##subversion compatible<cr>our $REVDATE = sprintf("%s", q$Date: 1957-03-27 13:29:27 -0500 (Wed, 27 March 1957) $ =~ m/(\d[\d\-\s:]+\d)/); ##subversion compatible<cr>our $PROGRAMNAME = sprintf("%s", q$Id: perlprogram.pl 1 1957-03-27 13:27:39Z schumack $ =~ m/Id: ([a-zA-Z]\w+)[\s\.].*/); ##subversion compatible<cr>our $REVSTAMP = "$REVISION:$REVDATE";$REVSTAMP =~ s/ /T/;$REVSTAMP =~ s/\s.*//;<cr>our $ichome;<cr>BEGIN<cr>{<cr>$ichome = glob('~ic');<cr>$ichome = $ENV{'ICHOME'} if (defined($ENV{'ICHOME'}) && ($ENV{'ICHOME'} ne ''));<cr>use constant TRUE    => 1;<cr>use constant FALSE   => 0;<cr>use constant DEBUG   => 'DEBUG:   ';<cr>use constant ERROR   => 'ERROR:   ';<cr>use constant WARNING => 'WARNING: ';<cr>use constant INFO    => 'INFO:    ';<cr>use constant NOTE    => 'NOTE:    ';<cr>}<cr>use feature qw( say signatures );<cr>no warnings "experimental::signatures";<cr>use File::Basename;<cr>use Getopt::Long qw(GetOptions);<cr>use Pod::Usage qw(pod2usage);<cr>use Term::ANSIColor;<cr>use Sys::Hostname;<cr>use POSIX qw(strftime);<cr>use Fcntl ":flock";<cr>use Cwd;<cr>use lib "$ichome/lib/perl";<cr><cr>$\|=1;    ## serve stdout hot<cr>if ((! defined($ENV{'PAGER'})) \|\| ($ENV{'PAGER'} eq ""))<cr>{<cr>$ENV{'PAGER'} = 'more';<cr>}<cr><cr># init colors<cr><BS><BS>my $REVERSE         = '';<cr>my $REVERSE_BLUE    = '';<cr>my $REVERSE_CYAN    = '';<cr>my $REVERSE_GREEN   = '';<cr>my $REVERSE_MAGENTA = '';<cr>my $REVERSE_RED     = '';<cr>my $REVERSE_YELLOW  = '';<cr>my $COLOR_RESET     = '';<cr><cr>my $color = TRUE;<cr>$color = FALSE if ((! defined($ENV{'TERM'})) \|\| ($ENV{'TERM'} =~ m/(hpterm\|emacs)/i));<cr>$color = FALSE if (! -t 0); # not running interactive<cr><cr>my $debug                 = FALSE;<cr>my $verbose               = FALSE;<cr>GetOptions(<cr>'debug!'                   => \$debug,<cr>'help'                     => \&printUsage,<cr>'verbose!'                 => \$verbose,<cr>'version'                  => \&printVersion,<cr>'xhelp\|xtermhelp'          => \&printUsageInXterm,<cr>) \|\| printUsage();<cr><cr>$verbose = TRUE if ($debug);<cr>if ($color) # using Term::ANSIColor<cr>{<cr>$REVERSE_YELLOW  = color('bold reverse yellow on_black');<cr>$REVERSE_RED     = color('bold reverse red on_black');<cr>$REVERSE_CYAN    = color('bold reverse cyan on_black');<cr>$REVERSE_GREEN   = color('bold reverse green on_black');<cr>$REVERSE_MAGENTA = color('bold reverse magenta on_black');<cr>$REVERSE_BLUE    = color('bold reverse blue on_white');<cr>$REVERSE         = color('bold reverse');<cr>$COLOR_RESET     = color('reset');<cr>}<cr>################################################################################<cr><BS>################################################################################<cr><BS><cr><cr>#######<cr><BS>sub printUsage<cr>{<cr>my $extraMessage = shift; $extraMessage = "" unless (defined $extraMessage);<cr>pod2usage(-message => "$extraMessage\n", -exitval => 0,-verbose => 2,-noperldoc => 1);<cr>}<cr>################################################################################<cr><BS><cr>#######<cr><BS>sub printVersion<cr>{<cr>my $exit = shift; $exit = TRUE unless (defined $exit);<cr>my $versionInfo = "$PROGRAMNAME: $VERSION.$REVISION  Perl: $]";<cr>say $versionInfo;<cr>CORE::exit(0) if ($exit);<cr>$versionInfo;<cr>}<cr>################################################################################<cr><BS><cr>#######<cr><BS>sub printUsageInXterm<cr>{<cr>system("xterm -e '$0 -help \| $ENV{PAGER}'");<cr>exit 0;<cr>}<cr>################################################################################<cr><BS><cr><cr>__END__<cr><cr>=pod<cr><cr>=head1 NAME<cr><cr>xxxx - whatThisIsAndDoes<cr><cr>=head1 SYNOPSIS<cr><cr>xxxx [options]<cr><cr>=head1 OPTIONS<cr><cr> Note: Options are case-insensitive and can be shortened as long they remain unique.<cr><BS><cr> -help<cr>  Print this and exit<cr><cr><BS><BS>-version<cr>  Print version and exit<cr><cr><BS><BS>-xhelp  or  -xtermHelp<cr>  Open help in temporary xterm window<cr><cr>=cut

ab startperlwin #!/cygdrive/h/Perl/bin/perl -w<cr>#REV='@(#)$Id$ $Revision$ $Date$ subversion icrepo';<cr><BS><BS><cr>use strict;<cr>require 5.008;<cr>use warnings;<cr>our $VERSION = "0.1alpha";<cr>our $REVISION = sprintf("%s", q$Revision: 1 $ =~ m/(\d[\.\d]*)/); ##subversion compatible<cr>our $REVDATE = sprintf("%s", q$Date: 1957-03-27 13:29:27 -0500 (Wed, 27 March 1957) $ =~ m/(\d[\d\-\s:]+\d)/); ##subversion compatible<cr>our $PROGRAMNAME = sprintf("%s", q$Id: perlprogram.pl 1 1957-03-27 01:01:01Z schumack $ =~ m/Id: ([a-zA-Z]\w+)[\s\.].*/); ##subversion compatible<cr>our $REVSTAMP = "$REVISION:$REVDATE";$REVSTAMP =~ s/ /T/;$REVSTAMP =~ s/\s.*//;<cr>our $ichome;<cr>BEGIN<cr>{<cr>    $ichome = glob('~ic');<cr>    $ichome = $ENV{'ICHOME'} if (defined($ENV{'ICHOME'}) && ($ENV{'ICHOME'} ne ''));<cr>    use constant TRUE    => 1;<cr>    use constant FALSE   => 0;<cr>    use constant DEBUG   => 'DEBUG:   ';<cr>    use constant ERROR   => 'ERROR:   ';<cr>    use constant WARNING => 'WARNING: ';<cr>    use constant INFO    => 'INFO:    ';<cr>    use constant NOTE    => 'NOTE:    ';<cr>}<cr>use lib "/cygdrive/h/Perl/lib";<cr>use lib "/cygdrive/h/Perl/site/lib";<cr>use File::Basename;<cr>use Getopt::Long qw(GetOptions);<cr>use Pod::Usage;<cr>use Term::ANSIColor;<cr>use Sys::Hostname;<cr>use POSIX qw(strftime);<cr>use Fcntl ":flock";<cr>use Cwd;<cr>use lib "$ichome/lib/perl";<cr><cr># declare subroutines<cr><BS><cr>sub printUsage;<cr>sub printUsageInXterm;<cr>sub printVersion;<cr><cr>$\|=1;    ## serve stdout hot<cr>$\="\n"; ## default print() ending<cr>if ((! defined($ENV{'PAGER'})) \|\| ($ENV{'PAGER'} eq ""))<cr>{<cr>    $ENV{'PAGER'} = 'more';<cr>}<cr><cr># init colors<cr>my $REVERSE         = '';<cr>my $REVERSE_BLUE    = '';<cr>my $REVERSE_CYAN    = '';<cr>my $REVERSE_GREEN   = '';<cr>my $REVERSE_MAGENTA = '';<cr>my $REVERSE_RED     = '';<cr>my $REVERSE_YELLOW  = '';<cr>my $COLOR_RESET     = '';<cr><cr>my $color = TRUE;<cr>$color = FALSE if ((! defined($ENV{'TERM'})) \|\| ($ENV{'TERM'} =~ m/(hpterm\|emacs)/i));<cr>$color = FALSE if (! -t 0); # not running interactive<cr><cr>my $debug                 = FALSE;<cr>my $verbose               = FALSE;<cr>GetOptions(<cr>    'help'                     => \&printUsage,<cr>    'version'                  => \&printVersion,<cr>) \|\| printUsage();<cr><cr>$verbose = TRUE if ($debug);<cr>if ($color) # using Term::ANSIColor<cr>{<cr>    $REVERSE_YELLOW  = color('bold reverse yellow on_black');<cr>    $REVERSE_RED     = color('bold reverse red on_black');<cr>    $REVERSE_CYAN    = color('bold reverse cyan on_black');<cr>    $REVERSE_GREEN   = color('bold reverse green on_black');<cr>    $REVERSE_MAGENTA = color('bold reverse magenta on_black');<cr>    $REVERSE_BLUE    = color('bold reverse blue on_white');<cr>    $REVERSE         = color('bold reverse');<cr>    $COLOR_RESET     = color('reset');<cr>}<cr><cr>#######<cr>sub printUsage<cr>{<cr>    my $extraMessage = shift;<cr>    if (defined($extraMessage))<cr>    {<cr>        print "$extraMessage\n";<cr>        pod2usage(-message => "$extraMessage\n", -exitval => 0,-verbose => 2);<cr>    }<cr>    else<cr>    {<cr>        pod2usage(-exitval => 0,-verbose => 2);<cr>    }<cr>}<cr>################################################################################<cr><cr>#######<cr>sub printVersion()<cr>{<cr>    my(%arg) = @_;<cr>    my $exit = $arg{'-exit'};<cr>    $exit = TRUE unless(defined($exit));<cr><cr>    my $versionInfo = "$PROGRAMNAME: $VERSION.$REVISION";<cr>    print $versionInfo;<cr>    CORE::exit(0) if($exit);<cr>    $versionInfo;<cr>}<cr>################################################################################<cr><cr><cr>__END__<cr><cr>=pod<cr><cr>=head1 NAME<cr><cr>xxxx - whatThisIsAndDoes<cr><cr>=head1 SYNOPSIS<cr><cr>xxxx [options]<cr><cr>=head1 OPTIONS<cr><cr> Note: Options are case-insensitive and can be shortened as long they remain unique.<cr><cr><BS><cr>  -help<cr>    Print this and exit<cr><cr>  -version<cr>    Print version and exit<cr><cr>=cut

ab  perlheader #!/usr/bin/perl -w<cr>#!/usr/bin/perl -d:ptkdb<cr>#!/usr/bin/perl -d:NYTProf<cr>
ab  kvs Ken Schumack
ab  tkvs Thanks,Ken Schumack
set nu
set noai
set errorbells
set hardtabs=8
set tabstop=8
set tabstop=4
set shiftwidth=8
set shiftwidth=4
set expandtab
set lisp
set sm
set ic
set cmdheight=2
set showmode
syntax on

" ===================================================================
" PGP - encryption and decryption
" ===================================================================
"
" encrypt
" map ;e :%!/bin/sh -c 'pgp -feast 2>/dev/tty'
" map ;e :%!/bin/sh -c 'pgp -feast'
"  map ;e :%! /bin/sh -c '/user/schumack/bin/pgp +force -fac 2>/dev/null'
"  map ;e :%! pgp -fac 
" decrypt
" map ;d :/^-----BEG/,/^-----END/!/bin/sh -c 'pgp -f 2>/dev/tty'
"  map ;d :/^-----BEGIN.PGP.MESSAGE-----/,/^-----END.PGP.MESSAGE-----/!/bin/sh -c 'pgp -f 2>/dev/null'
" sign
"  map ;s :,$! /bin/sh -c 'pgp -fast +clear 2>/dev/tty'
"  map ;v :,/^-----END/w !pgp -m
"

" ===================================================================
" ASCII tables - you may need them some day.  Save them to a file!
" ===================================================================
"
" ASCII Table - | octal value - name/char |
"
" |000 nul|001 soh|002 stx|003 etx|004 eot|005 enq|006 ack|007 bel|
" |010 bs |011 ht |012 nl |013 vt |014 np |015 cr |016 so |017 si |
" |020 dle|021 dc1|022 dc2|023 dc3|024 dc4|025 nak|026 syn|027 etb|
" |030 can|031 em |032 sub|033 esc|034 fs |035 gs |036 rs |037 us |
" |040 sp |041  ! |042  " |043  # |044  $ |045  % |046  & |047  ' |
" |050  ( |051  ) |052  * |053  + |054  , |055  - |056  . |057  / |
" |060  0 |061  1 |062  2 |063  3 |064  4 |065  5 |066  6 |067  7 |
" |070  8 |071  9 |072  : |073  ; |074  < |075  = |076  > |077  ? |
" |100  @ |101  A |102  B |103  C |104  D |105  E |106  F |107  G |
" |110  H |111  I |112  J |113  K |114  L |115  M |116  N |117  O |
" |120  P |121  Q |122  R |123  S |124  T |125  U |126  V |127  W |
" |130  X |131  Y |132  Z |133  [ |134  \ |135  ] |136  ^ |137  _ |
" |140  ` |141  a |142  b |143  c |144  d |145  e |146  f |147  g |
" |150  h |151  i |152  j |153  k |154  l |155  m |156  n |157  o |
" |160  p |161  q |162  r |163  s |164  t |165  u |166  v |167  w |
" |170  x |171  y |172  z |173  { |174  | |175  } |176  ~ |177 del|
"
" ===================================================================
" ASCII Table - | decimal value - name/char |
"
" |000 nul|001 soh|002 stx|003 etx|004 eot|005 enq|006 ack|007 bel|
" |008 bs |009 ht |010 nl |011 vt |012 np |013 cr |014 so |015 si |
" |016 dle|017 dc1|018 dc2|019 dc3|020 dc4|021 nak|022 syn|023 etb|
" |024 can|025 em |026 sub|027 esc|028 fs |029 gs |030 rs |031 us |
" |032 sp |033  ! |034  " |035  # |036  $ |037  % |038  & |039  ' |
" |040  ( |041  ) |042  * |043  + |044  , |045  - |046  . |047  / |
" |048  0 |049  1 |050  2 |051  3 |052  4 |053  5 |054  6 |055  7 |
" |056  8 |057  9 |058  : |059  ; |060  < |061  = |062  > |063  ? |
" |064  @ |065  A |066  B |067  C |068  D |069  E |070  F |071  G |
" |072  H |073  I |074  J |075  K |076  L |077  M |078  N |079  O |
" |080  P |081  Q |082  R |083  S |084  T |085  U |086  V |087  W |
" |088  X |089  Y |090  Z |091  [ |092  \ |093  ] |094  ^ |095  _ |
" |096  ` |097  a |098  b |099  c |100  d |101  e |102  f |103  g |
" |104  h |105  i |106  j |107  k |108  l |109  m |110  n |111  o |
" |112  p |113  q |114  r |115  s |116  t |117  u |118  v |119  w |
" |120  x |121  y |122  z |123  { |124  | |125  } |126  ~ |127 del|
"
" ===================================================================
" ASCII Table - | hex value - name/char |
"
" | 00 nul| 01 soh| 02 stx| 03 etx| 04 eot| 05 enq| 06 ack| 07 bel|
" | 08 bs | 09 ht | 0a nl | 0b vt | 0c np | 0d cr | 0e so | 0f si |
" | 10 dle| 11 dc1| 12 dc2| 13 dc3| 14 dc4| 15 nak| 16 syn| 17 etb|
" | 18 can| 19 em | 1a sub| 1b esc| 1c fs | 1d gs | 1e rs | 1f us |
" | 20 sp | 21  ! | 22  " | 23  # | 24  $ | 25  % | 26  & | 27  ' |
" | 28  ( | 29  ) | 2a  * | 2b  + | 2c  , | 2d  - | 2e  . | 2f  / |
" | 30  0 | 31  1 | 32  2 | 33  3 | 34  4 | 35  5 | 36  6 | 37  7 |
" | 38  8 | 39  9 | 3a  : | 3b  ; | 3c  < | 3d  = | 3e  > | 3f  ? |
" | 40  @ | 41  A | 42  B | 43  C | 44  D | 45  E | 46  F | 47  G |
" | 48  H | 49  I | 4a  J | 4b  K | 4c  L | 4d  M | 4e  N | 4f  O |
" | 50  P | 51  Q | 52  R | 53  S | 54  T | 55  U | 56  V | 57  W |
" | 58  X | 59  Y | 5a  Z | 5b  [ | 5c  \ | 5d  ] | 5e  ^ | 5f  _ |
" | 60  ` | 61  a | 62  b | 63  c | 64  d | 65  e | 66  f | 67  g |
" | 68  h | 69  i | 6a  j | 6b  k | 6c  l | 6d  m | 6e  n | 6f  o |
" | 70  p | 71  q | 72  r | 73  s | 74  t | 75  u | 76  v | 77  w |
" | 78  x | 79  y | 7a  z | 7b  { | 7c  | | 7d  } | 7e  ~ | 7f del|
" ===================================================================
"
" ===================================================================
" Yet another example for an autocommand:  [980616]
  au VimLeave * echo "Thanks for using Vim"version
