package luhn

import "strings"

func Valid(id string) bool {
	id = strings.Replace(id, " ", "", -1)

	sum := 0
	factor := 1

	for i := len(id) - 1; i >= 0; i-- {
		char := id[i]

		switch {
		case char >= '0' && char <= '9':
			num := int(char - '0')

			num *= factor
			if num > 9 {
				num -= 9
			}
			sum += num

			factor = 3 - factor
		default:
			return false
		}
	}

	return len(id) > 1 && sum%10 == 0
}
