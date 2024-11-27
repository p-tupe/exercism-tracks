// Package weather provides weather forecast for a city.
package weather

// CurrentCondition stores the current weather condition.
var CurrentCondition string

// CurrentLocation stores the current city.
var CurrentLocation string

// Forecast returns a string of the current weather condition in a city.
func Forecast(city, condition string) string {
	CurrentLocation, CurrentCondition = city, condition
	return CurrentLocation + " - current weather condition: " + CurrentCondition
}
