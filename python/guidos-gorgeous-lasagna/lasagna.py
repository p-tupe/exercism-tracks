"""Functions used in preparing Guido's gorgeous lasagna.

Learn about Guido, the creator of the Python language: https://en.wikipedia.org/wiki/Guido_van_Rossum
"""

# Minutes the lasagna should bake in the oven.
EXPECTED_BAKE_TIME = 40

# Minutes it takes to prepare a single layer.
PREPARATION_TIME = 2


def bake_time_remaining(elapsed_bake_time):
    """Calculate the bake time remaining.

    :param elapsed_bake_time: int - baking time already elapsed.
    :return: int - remaining bake time (in minutes) derived from 'EXPECTED_BAKE_TIME'.

    Function that takes the actual minutes the lasagna has been in the oven as
    an argument and returns how many minutes the lasagna still needs to bake
    based on the `EXPECTED_BAKE_TIME`.
    """

    return EXPECTED_BAKE_TIME - elapsed_bake_time


def preparation_time_in_minutes(number_of_layers):
    """
    Return elapsed cooking time.

    This function takes two numbers representing the number of layers & the time already spent baking and calculates the total elapsed minutes spent cooking the lasagna.
    """

    return PREPARATION_TIME * number_of_layers


def elapsed_time_in_minutes(number_of_layers, elapsed_bake_time):
    """
    Calculate the total number of minutes spent cooking

    :param number_of_layers: int - the number of layers added to lasagna
    :param elapsed_bake_time: int - the number of minutes the lasagna has been baking in the oven
    :return: int - number of minutes spent cooking
    """

    return preparation_time_in_minutes(number_of_layers) + elapsed_bake_time
