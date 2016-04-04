#!/usr/bin/perl -w
#HW6- Perl script to read in user data and output to seperate files
#CS390 Spring 2016
#Philip Jarrett

use strict;
use Data::Dumper;

my @items;
my @name;

if($#ARGV+1 == 0)
{
	print "Please give a file name to read from\n";
	print "Usage: jarrett.sh databook.txt\n";
	exit 1;
}

my $info = {};
while (<>) {
	
    chomp;
    my @items = split /:/, $_;
     $info->{$items[1]} = { name => $items[0], 
                            address => $items[2], 
                            date => $items[3], 
                            salary => $items[4] };
}

print "$info{name}\n";

print "End of program!\n";

