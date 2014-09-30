#!/usr/bin/perl 
#===============================================================================
#
#         FILE:  generateOligomers.pl
#
#        USAGE:  ./generateOligomers.pl  
#
#  DESCRIPTION:  
#
#      OPTIONS:  ---
# REQUIREMENTS:  ---
#         BUGS:  ---
#        NOTES:  ---
#       AUTHOR:  Dr. Pieter De Bleser (), pieterdb@dmbr.vib-ugent.be
#      COMPANY:  Department for Molecular Biomedical Research (DMBR), VIB
#      VERSION:  1.0
#      CREATED:  08/03/2010 04:24:17 PM
#     REVISION:  ---
#===============================================================================

use strict;
use warnings;
use Getopt::Long;


my $ktuple;

GetOptions( 'k:s' => \$ktuple,);
if(!defined $ktuple) {
    print STDERR "===================\n";
    print STDERR "Error: Input of the length of the requested oligomers is required!\n";
    print STDERR "Usage: $0 -k oligomer_length\n";
}

my @oligomers = generateOligomers($ktuple);

foreach my $oligo (@oligomers) {
        print "$oligo\n";
        }

#######################################################################################################
#
# generateOligomers
#

sub generateOligomers {
my ($ktuple) = @_;

my @oligomers = ();
my $oligomer;

for (my $tuple = 0; $tuple < (1<<2*$ktuple);$tuple++) {
    $oligomer = "";
    for (my $i = $ktuple - 1; $i >= 0; $i--) {
        my $position = ($tuple>>(2*$i))%4;
        $oligomer .= substr("ACGT",$position,1);
        }
    push(@oligomers, $oligomer);
    }
return(@oligomers);
}




