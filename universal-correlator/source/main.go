package main

import (
	"fmt"
	"time"
)

func main() {
	fmt.Println("Starting universal correlator")
	for true {
		fmt.Print(".")
		time.Sleep(5 * time.Second)
	}
}
