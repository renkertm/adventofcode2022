use std::fs;
use std::cmp::Ordering;
use std::env;

fn main() {
    let mut count = 0;

    let dir = env::current_exe().expect("Exe has to be in a dir");
    let dir = dir.parent().expect("Exe has to be in a dir");
    let input = fs::read_to_string(dir.join("input.txt")).expect("Error reading file");

    let mut rows: Vec<&str> = input.split("\n").collect();
    rows.remove(rows.len() - 1);

    for line in &rows {
        let ranges: Vec<&str> = line.split(",").collect();
        let range1 = ranges[0];
        let range1: Vec<&str> = range1.split("-").collect();
        let small1: u32 = range1[0].trim().parse().expect("Couldnt parse");
        let big1: u32 = range1[1].trim().parse().expect("Couldnt parse");
        let range2 = ranges[1];
        let range2: Vec<&str> = range2.split("-").collect();
        let small2: u32 = range2[0].trim().parse().expect("Couldnt parse");
        let big2: u32 = range2[1].trim().parse().expect("Couldnt parse");
        match small1.cmp(&small2) {
            Ordering::Less => {
                if big1 >= big2{
                    count += 1;
                }
            }
            Ordering::Greater => {
                if big1 <= big2{
                    count += 1;
                }
            }
            Ordering::Equal => {
                count += 1;
            }
        }
    }

    println!("{count}")
}