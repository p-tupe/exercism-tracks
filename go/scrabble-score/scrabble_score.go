package scrabble

import "strings"

// letterValues consists of sets of letters and their corresponding values.
var letterValues = map[string]int{
	"AEIOULNRST": 1,
	"DG":         2,
	"BCMP":       3,
	"FHVWY":      4,
	"K":          5,
	"JX":         8,
	"QZ":         10,
}

// Score computes a word's scrabble score by summing up the values
// according to [letterValues]
func Score(word string) int {
	wordValue := 0
	for _, rune := range word {
		for letterSet, value := range letterValues {
			if letter := strings.ToUpper(string(rune)); strings.Contains(letterSet, letter) {
				wordValue += value
			}
		}
	}
	return wordValue
}
