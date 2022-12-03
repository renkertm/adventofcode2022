#!usr/bin/perl
use strict;
use warnings;
use Path::Tiny;
use autodie;
use File::Basename;

my $dir = path(dirname(__FILE__));
my $file = $dir->child("input.txt");

my $content = $file->slurp_utf8();
my @content = split "\n", $content;
my $sum = 0;

my $count = 0;

for (@content){
    if(($count + 1) % 3 == 0 && $count > 0){
        for my $char (split //, $content[$count-2]){
            if(index($content[$count-1], $char) != -1 && index($content[$count], $char) != -1){
                my $c = 1;
                for(("a" .. "z", "A" .. "Z")){
                    if($_ eq $char){
                        $sum += $c;
                    }
                    $c++;
                }
                last;
            }
        }
    }
    $count++;
}
print $sum;