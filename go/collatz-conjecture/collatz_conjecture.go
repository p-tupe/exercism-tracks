package collatzconjecture

import (
	"fmt"
)

// CollatzConjecture returns the count of steps required for a number to
// reach 1, for any given positive integer n.
// If n <= 0, returns -1 and the corresponding error.
func CollatzConjecture(n int) (int, error) {
	if n <= 0 {
		return -1, fmt.Errorf("Expected a positive int, received %d.", n)
	}

	steps := 0
	for n != 1 {
		if n%2 == 0 {
			n = n / 2
		} else {
			n = n*3 + 1
		}

		steps++
	}

	return steps, nil
}
