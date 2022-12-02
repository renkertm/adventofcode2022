package main

import (
	"fmt"
	"io/ioutil"
	"log"
	"strings"
)

func main() {
    
	sum := 0

	content, err := ioutil.ReadFile("input.txt")

	if err != nil {
		log.Fatal(err)
	}

	input := strings.Split(string(content), "\n")

	for _, s := range input {
		items := strings.Split(s, " ")
		if len(items) < 2{
			break
		}
		sum += getRes(items[0], items[1])
	}

	fmt.Println(sum)

}

func getRes(a string, b string) int {
	win := [3]string{"AY","BZ","CX"}
	lose := [3]string{"AZ","BX","CY"}
	draw := [3]string{"AX","BY","CZ"}
	switch b {
	case "X": return convert(match(lose, a)) + 0
	case "Y": return convert(match(draw, a)) + 3
	case "Z": return convert(match(win, a)) + 6
	}
	return -1
}

func contains(s [3]string, e string) bool {
    for _, a := range s {
        if a == e {
            return true
        }
    }
    return false
}

func match(s [3]string, e string) string {
	for _, a := range s {
		if strings.Contains(a, e){
			return a[len(a)-1:]
		}
	}
	return ""
}

func convert(item string) int {
	switch item {
	case "X": return 1
	case "Y": return 2
	case "Z": return 3
	}
	return -1
}