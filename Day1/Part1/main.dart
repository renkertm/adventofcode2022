import 'dart:io';
import 'dart:async';

List<String> input = new List.empty(growable: true);
List<int> elves = new List.empty(growable: true);

void main(){
  String inp = File("input.txt").readAsStringSync();
  input = inp.split("\n\n");
  input.forEach((e) {
    int elf = 0;
    e.split("\n").forEach((element) { 
      String nString = element.replaceAll(RegExp(r"/^([^0-9]*)$/"), "");
      if(int.tryParse(nString) != null){
        elf += int.parse(nString);
      }
     });
    elves.add(elf);
  });
  elves.sort();
  print(elves.last);
}