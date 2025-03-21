package hamming

import "fmt"

// Calculate the Hamming Distance between two DNA strands.
func Distance(a, b string) (int, error) {
	if len(a) != len(b) {
		return -1, fmt.Errorf("Hamming distance is only defined for sequences of equal length")
	}

	d := 0
	for i := range a {
		if a[i] != b[i] {
			d++
		}
	}

	return d, nil
}
