package main

import (
	"C"
)

//export Sum
func Sum(a C.int, b C.int) C.int {
	return a + b
}

func main() {
}
