// Package twofer implements the ShareWith function
package twofer

import "fmt"

// ShareWith function returns a "One for X, one for me." string,
// where X is either the supplied name or a literal "you".
func ShareWith(name string) string {
	if name == "" {
		name = "you"
	}
	return fmt.Sprintf("One for %s, one for me.", name)
}
