package main

import (
	"fmt"
	"os"

	"github.com/niumlaque/ievio"
)

func onRead(input *ievio.InputEvent) {
	fmt.Println(input)
}

func main() {
	if len(os.Args) == 2 {
		err := ievio.Read(os.Args[1], onRead)
		if err != nil {
			fmt.Println(err)
			os.Exit(1)
		}
	} else if len(os.Args) == 5 {
		input, err := ievio.Write(os.Args[1], os.Args[2], os.Args[3], os.Args[4])
		if err != nil {
			fmt.Println(err)
			os.Exit(1)
		}

		fmt.Println(input)
	} else {
		fmt.Println("Usage of ./ievctl:")
		fmt.Println("    ./ievctl DEVICE [TYPE CODE VALUE]")
		os.Exit(1)
	}
}
