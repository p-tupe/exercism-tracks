package lasagna

func PreparationTime(layers []string, time int) int {
	if time == 0 {
		time = 2
	}
	return len(layers) * time
}

func Quantities(layers []string) (int, float64) {
	noodles := 0
	sauce := 0.0

	for _, l := range layers {
		if l == "sauce" {
			sauce += 0.2
		} else if l == "noodles" {
			noodles += 50
		}
	}

	return noodles, sauce
}

func AddSecretIngredient(firendsList, myList []string) {
	myList[len(myList)-1] = firendsList[len(firendsList)-1]
}

func ScaleRecipe(quantities []float64, portions int) []float64 {
	scaledQuantities := make([]float64, len(quantities))
	for i := range quantities {
		scaledQuantities[i] = quantities[i] / 2 * float64(portions)
	}
	return scaledQuantities
}
