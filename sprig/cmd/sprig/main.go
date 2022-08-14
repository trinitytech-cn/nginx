package main

import (
	"io/ioutil"
	"os"
	"text/template"

	"github.com/Masterminds/sprig/v3"
)

func main() {
	input, err := ioutil.ReadAll(os.Stdin)
	if err != nil {
		panic(err)
	}
	tmpl, err := template.New("template").Funcs(template.FuncMap(sprig.FuncMap())).Parse(string(input))
	if err != nil {
		panic(err)
	}
	err = tmpl.Execute(os.Stdout, nil)
	if err != nil {
		panic(err)
	}
}
