#!/usr/bin/perl -w

# unless pass a time value to localtime, it will create an array of time info for the current time

@times=localtime();
foreach (@times) { print $_."\n";}

# the values of each elemeents of this array are
# SS:MM:HH:DD:num of month: number of year(from 1900): num of days: julia date

$sec=$times[0];
$min=$times[1];
$hr=$times[2];
$dmon=$times[3];
$mon=$times[4] + 1; # month: 0 - 11, hence 1 is added
$year = 1900 + $times[5]; # number of years from 1900
$dweek= $times[6];
$dyear = $times[7];
$dsaving = $times[8];

print "\n break down to individual element...\n";
print "ss:\t$sec\n";
print "mm:\t$min\n";
print "hh:\t$hr\n";
print "Day:\t$dmon\n";
print "Month:\t$mon\n";
print "YYYY:\t$year\n";
print "Day of Week:\t$dweek\n";
print "Day of year:\t$dyear\n";
print "Daytime saving:\t$dsaving\n\n\n";
