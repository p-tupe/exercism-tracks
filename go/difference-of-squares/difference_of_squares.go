package diffsquares

func SquareOfSum(n int) int {
	sum := n * (n + 1) / 2
	return sum * sum
}

func SumOfSquares(n int) int {
	sum := (n * (n + 1) * (2*n + 1)) / 6
	return sum
}

func Difference(n int) int {
	// Perhaps channels make a difference for large numbers?
	sumOfSquaresChan := make(chan int)
	squareOfSumChan := make(chan int)

	go func() { sumOfSquaresChan <- SumOfSquares(n) }()
	go func() { squareOfSumChan <- SquareOfSum(n) }()

	diff := (<-sumOfSquaresChan - <-squareOfSumChan)

	if diff < 0 {
		return -diff
	}

	return diff
}
