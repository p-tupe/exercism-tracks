package thefarm

import (
	"errors"
	"fmt"
)

func DivideFood(f FodderCalculator, n int) (float64, error) {
	fa, err := f.FodderAmount(n)
	if err != nil {
		return 0, err
	}

	ff, err := f.FatteningFactor()
	if err != nil {
		return 0, err
	}

	return fa * ff / float64(n), nil
}

func ValidateInputAndDivideFood(f FodderCalculator, n int) (float64, error) {
	if n <= 0 {
		return 0, errors.New("invalid number of cows")
	}

	return DivideFood(f, n)
}

type InvalidCowsError struct {
	numCows int
	message string
}

func (i InvalidCowsError) Error() string {
	return fmt.Sprintf("%d cows are invalid: %s", i.numCows, i.message)
}

func ValidateNumberOfCows(n int) error {
	if n < 0 {
		return &InvalidCowsError{numCows: n, message: "there are no negative cows"}
	}

	if n == 0 {
		return &InvalidCowsError{numCows: n, message: "no cows don't need food"}
	}

	return nil
}
