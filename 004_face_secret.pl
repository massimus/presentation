use Modern::Perl;
use Facebook::OpenGraph;
# get access_token for application
 my $token_ref = Facebook::OpenGraph->new(+{
     app_id => 375324055986753,
         secret => 'a291d7f26f909c137bba22cdf809c393',
         })->get_app_token;

use Data::Dumper;
say Dumper $token_ref;
