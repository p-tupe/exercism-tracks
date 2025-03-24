package isogram

import (
	"slices"
	"strings"
)

func IsIsogram(word string) bool {
	word = strings.ToLower(word)
	uniqueLetters := []rune{}
	specialCounter := 0

	for _, l := range word {
		if l == ' ' || l == '-' {
			specialCounter++
			continue
		}

		uniqueLetters = append(uniqueLetters, l)
		slices.Sort(uniqueLetters)
		uniqueLetters = slices.Compact(uniqueLetters)
	}

	return len(word) == len(uniqueLetters)+specialCounter
}
