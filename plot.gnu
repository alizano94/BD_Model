#!/usr/bin/gnuplot --persist

#If need to test for arguments passing
#print "input file        : ", ARG1
#print "ouput file     : ", ARG2

#Set the output file 
set term png size 800, 800 enhanced
set output ARG2

#Format and plotting
unset border
unset tics
unset xlabel 
unset ylabel
set xrange [-30.0:30.0]
set yrange [-30.0:30.0]
plot ARG1 u ($2):($3) notitle pointtype 7 pointsize 3 