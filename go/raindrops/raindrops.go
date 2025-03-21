// Package raindrops implements musical notes from pouring rain.
package raindrops

import (
	"strconv"
	"strings"
)

// Sounds is a collection of notes corresponding to each factor
var Sounds = []struct {
	f int
	s string
}{
	{3, "Pling"},
	{5, "Plang"},
	{7, "Plong"},
}

// Convert function takes in a number an returns resulting notes,
// based on the factors found in [Sounds]
func Convert(number int) string {
	ret := strings.Builder{}

	for _, s := range Sounds {
		if number%s.f == 0 {
			ret.WriteString(s.s)
		}
	}

	if ret.Len() > 0 {
		return ret.String()
	}

	return strconv.Itoa(number)
}
