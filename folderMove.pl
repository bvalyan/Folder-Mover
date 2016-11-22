use strict;
use warnings;
use File::Copy;
use File::Path;
my $folderDate = "2016_Q3";
my $folderClient = '';

use constant {
    FROM_DIR => "C:\\EDI\\DATA\\",
};


opendir my $dir, FROM_DIR;

while(my $file = readdir $dir){

	if ( $file =~ m/^(\w{8}).*\.835$/){
		my $TO_DIR = "C:\\$1_$folderDate";
	 	my $path = $TO_DIR;

	 	if (! -d $path)
		{
		  print "Directory not found. Creating path $path\n";
		  my $dirs = eval { mkpath($path) };
		  die "Failed to create $path: $@\n" unless $dirs;
		}
	 	my $from = FROM_DIR . "/" . "$file";
	 	print "Moving $from to $TO_DIR\n";
    	move $from, $TO_DIR;
	}
}