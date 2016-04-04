#!/usr/bin/perl 
#HW6- Perl script to read in user data and output to seperate files
#CS390 Spring 2016
#Philip Jarrett

use strict;
use Data::Dumper;

my @items;
my $info = {};
my($first,$last,$state);


if($#ARGV+1 == 0)
{
	print "Please give a file name to read from\n";
	print "Usage: jarrett.sh databook.txt\n";
	exit 1;
}

open (OUT, ">./state.txt");
open (OUT2, ">./dob.txt");
open (OUT3, ">./salary.txt");

while (<>) {
	
    chomp;
	my @items = split /:/, $_;
    my @name = $items[0];
    my @phone = $items[1];
    my @address = $items[2];
    my @date = $items[3];
    my @salary = $items[4];
    #print @address;

    #get states
    for (@address){
    	($state) = /([A-Z][A-Z])/;
    }

    #re-arrange names to last, first and print out with state
    for (@name){
    	($first,$last) = /(\w+)\s(\w+)/;
    	
    }

    #print out names and DOB
    for (@phone){
    	my @name_DOB = "$last\t$first\t@date\n";
    	my @name_state = "$state, $last, $first\n";
    	my @sorted_name_state = sort { $a cmp $b} @name_state;
    	print OUT @sorted_name_state;
    	print OUT2 @name_DOB;
    }
  
    #print out names and salary
    for (@phone){
    	my @name_salary = "$last\t$first\t@salary\n";
    	print OUT3 @name_salary;
    }
   
}


    close(OUT);
	close(OUT2);
	close(OUT3);


print "End of program!\n";

