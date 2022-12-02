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
		if len(items) < 2 {
			break
		}
		sum += checkRes(items[0], items[1]) + convert(items[1])
	}

	fmt.Println(sum)

}

func checkRes(a string, b string) int {
	win := [6]string{"AY","BZ","CX"}
	lose := [6]string{"AZ","BX","CY"}
	if contains(win, a + b) {
		return 6
	}
	if contains(lose, a + b) {
		return 0
	}else {return 3}
}

func contains(s [6]string, e string) bool {
    for _, a := range s {
        if a == e {
            return true
        }
    }
    return false
}

func convert(item string) int {
	switch item {
	case "X": return 1
	case "Y": return 2
	case "Z": return 3
	}
	return -1
}