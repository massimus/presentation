#!/usr/bin/perl
# решение здесь
use strict;
use warnings;
use Data::Printer;
my @dominoes;
while ( my $row = <> ) {
    @dominoes = split / /, $row;

    # chomp $row;
    # print "$row\n";
}
my %d_hash = ();

# foreach my $domino (@dominoes) {
# $d_hash{$domino} = [ split //, $domino ];
# }

map { $d_hash{$_} = [ split //, $_ ] } @dominoes;

# p @dominoes;
# p %d_hash;
my $i = @dominoes - 2;

# print +@dominoes."\n";
# print "####" . $i . "\n";
my $ck  = 0;
my %rez = ();
foreach my $domino ( 0 .. $i ) {

    # print "\$dominoes[$i]" . $dominoes[$i] . "\n";
    # print "\$domino: " . $dominoes[$i] . "\n";
    # print "@" x 20 . "\n";
    for my $d ( 0 .. 1 ) {

        # print "\$d " . ${ $d_hash{ $dominoes[$i] } }[$d] . "\n";
        for my $d2 ( 0 .. 1 ) {
            if ( ${ $d_hash{ $dominoes[$i] } }[$d] eq
                ${ $d_hash{ $dominoes[ $i + 1 ] } }[$d2] )
            {

                # p @{ $d_hash{ $dominoes[$i] } };
                # p @{ $d_hash{ $dominoes[$i+1] } };
                # print ${ $d_hash{ $dominoes[$i] } }[$d].'eq',
                # ${ $d_hash{ $dominoes[ $i + 1 ] } }[$d2]."\n";
                # print $i."=i=".($i+1)."\n";
                $rez{   length ${ $d_hash{ $dominoes[$i] } }[ $d - 1 ]
                      . ${ $d_hash{ $dominoes[$i] } }[$d] . ' '
                      . ${ $d_hash{ $dominoes[ $i + 1 ] } }[$d2]
                      . ${ $d_hash{ $dominoes[ $i + 1 ] } }[ $d2 - 1 ] } =
                    ${ $d_hash{ $dominoes[$i] } }[ $d - 1 ]
                  . ${ $d_hash{ $dominoes[$i] } }[$d] . ' '
                  . ${ $d_hash{ $dominoes[ $i + 1 ] } }[$d2]
                  . ${ $d_hash{ $dominoes[ $i + 1 ] } }[ $d2 - 1 ];

                # print "OK";
                $ck = 1;
            }

            # print "\$d2+1 " . ${ $d_hash{ $dominoes[ $i + 1 ] } }[$d2] . "\n";
        }
    }

    # print "@" x 20 . "\n";
    $i++;
}

if ( @dominoes == 1 ) {

    # p %d_hash;
    # $ck == 1;
    # print keys %d_hash;
    my @arr = values %d_hash;

    # p @arr;
    if ( $arr[0][0] == $arr[0][1] ) {
        print @{ $arr[0] };
    }
    else {
        print $ck;
    }
}
elsif ( $ck == 0 ) {
    print $ck;
}
else {
    my ($max) = sort { $b <=> $a } keys %rez;
    print $rez{$max};

    # p %rez;
    # print 'OK';
}

# 1)вывести 0, если их нельзя закольцевать.+
# while(<>){
# push @F;
# }
# # print "11 12 22 23 31\n";
