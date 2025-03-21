// Package leap implements utility functions related to leap years.
package leap

// IsLeapYear is a predicate for whether a given year is a leap year.
func IsLeapYear(year int) bool {
	return year%400 == 0 || year%100 != 0 && year%4 == 0
}
