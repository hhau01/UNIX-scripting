#!/usr/bin/perl
#CS260 Programming Project 3 - phonebook.pl

use warnings;
use strict;

open FH, "datebook.txt" or die $!;
my @FILE = <FH>;

sub menu{
	system("clear");
	print "*** Welcome to Cal Poly's Phonebook System ***\n";
	print "\n";
	print "(1) List Records in Alphabetical Order\n";
	print "(2) List Records in Reverse Alphabetical order\n";
	print "(3) Search for a Record by Last Name\n";
	print "(4) Search for a Record by Birthday\n";
	print "(5) Exit\n";
	print "\n";
	print "==> Please select option (1-5): ";
	print "\n";
	my $choice = <STDIN>;
	
	#can't locate switch.pm
	if($choice == 1){&listAlpha(@FILE);}
	elsif($choice == 2){&listRAlpha(@FILE);}
	elsif($choice == 3){&searchLName(@FILE);}
	elsif($choice == 4){&searchBday(@FILE);}
	elsif($choice == 5){print "Thank you for using the Phonebook System.\n"; exit;}
	else{print "Incorrect choice.\n";}
}
sub listAlpha{
	system("clear");
	print "List Records in Alphabetical Order\n";
	print "(1) Sort by First Name\n";
	print "(2) Sort by Last Name\n";
	print "\n";
	my $choice = <STDIN>;
	print "\n";
	if($choice == 1){
		my @alpha = sort {lc($a) cmp lc($b)} @_;
		print @alpha;
		print "\n";
		print "Press enter to continue.";
		my $pause = <STDIN>;
	}
	elsif($choice == 2){
		my @alpha = sort{
			(split " ", lc($a))[1] cmp 
			(split " ", lc($b))[1]} @_;
		print @alpha;
		print "\n";
		print "Press enter to continue.";
		my $pause = <STDIN>;
	}
	else{print "Incorrect choice.\n";}
}
sub listRAlpha{
	system("clear");
	print "List Records in Reverse Alphabetical Order\n";
	print "(1) Sort by First Name\n";
	print "(2) Sort by Last Name\n";
	print "\n";
	my $choice = <STDIN>;
	print "\n";
	if($choice == 1){
		#my @ralpha = reverse sort @_;
		my @ralpha = sort {lc($b) cmp lc($a)} @_;
		print @ralpha;
		print "\n";
		print "Press enter to continue.";
		my $pause = <STDIN>;
	}
	elsif($choice == 2){
		my @ralpha = sort{
			(split " ", lc($b))[1] cmp 
			(split " ", lc($a))[1]} @_;
		print @ralpha;
		print "\n";
		print "Press enter to continue.";
		my $pause = <STDIN>;
	}
	else{print "Incorrect choice.\n";}
}
sub searchLName{
	system("clear");
	print "Search for a Record by Last Name\n";
	print "Please enter Last Name: ";
	my $name = <STDIN>;
	chomp($name);
	print "\n";
	my @result = grep { / ${name}\:/ } @_;
	print @result;
	print "\n";
	print "Press enter to continue.";
	my $pause = <STDIN>;
}
sub searchBday{
	system("clear");
	print "Search for a Record by Birthday\n";
	print "(1) Search by Month\n";
	print "(2) Search by Year\n";
	print "\n";
	my $choice = <STDIN>;
	print "\n";
	if($choice == 1){
		print "Please enter Month [1-12]: ";
		my $month = <STDIN>;
		chomp($month);
		print "\n";
		my @result = grep { /\:${month}\// } @_;
		print @result;
		print "\n";
		print "Press enter to continue.";
		my $pause = <STDIN>;
	}
	elsif($choice == 2){
		print "Please enter Year [00-99]: ";
		my $year = <STDIN>;
		chomp($year);
		print "\n";
		my @result = grep { /\/${year}\:/ } @_;
		print @result;
		print "\n";
		print "Press enter to continue.";
		my $pause = <STDIN>;
	}
	else{print "Incorrect choice.\n";}
}

my $cont = 1;

while($cont == 1){
	system("clear");
	menu();
}
close(FH);
