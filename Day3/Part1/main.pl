#!usr/bin/perl
use strict;
use warnings;
use Path::Tiny;
use autodie;
use File::Basename;

my $dir = path(dirname(__FILE__));
my $file = $dir->child("input.txt");

my $file_handle = $file->openr_utf8();
my $sum = 0;

while( my $line = $file_handle->getline() ) {
    $line =~ s/\n//g;
    my $h1 = substr $line, 0, (length $line) / 2;
    my $h2 = substr $line, (length $line) / 2;
    my $c = 1;
    for(('a' .. 'z', 'A' .. 'Z')){
        if(index($h1, $_) != -1 && index($h2, $_) != -1){
            $sum += $c;
        }
        $c++;
    }
}
print $sum;