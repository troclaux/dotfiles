package main

import (
	"bufio"
	"fmt"
	"os"
)

func check(e error) {
	if e != nil {
		panic(e)
	}
}

func main() {
	conf_path := "/etc/dnf/dnf.conf"
	strings_to_check := []string{"max_parallel_downloads=5", "fastestmirror=True", "deltarpm=True"}

	file, err := os.Open(conf_path)
	check(err)

	defer file.Close()

	configMap := make(map[string]bool)

	scanner := bufio.NewScanner(file)
	for scanner.Scan() {
		line := scanner.Text()
		for _, str := range strings_to_check {
			if line == str {
				configMap[str] = true
			}
		}
	}

	file, err = os.OpenFile(conf_path, os.O_APPEND|os.O_WRONLY, 0644)
	check(err)
	defer file.Close()

	writer := bufio.NewWriter(file)
	for _, str := range strings_to_check {
		if !configMap[str] {
			_, err := file.WriteString(fmt.Sprintf("\n%s", str))
			check(err)
			fmt.Printf("\nWrote %s to end of %s\n", str, conf_path)
		}
		fmt.Println(str)
		fmt.Println(configMap[str])
		configMap[str] = true
	}

	writer.Flush()

}
