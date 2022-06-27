def exchange_money(budget, exchange_rate):
    """
    Function calculates the value of the exchanged currency.

    :param budget: float - amount of money you are planning to exchange.
    :param exchange_rate: float - unit value of the foreign currency.
    :return: float - exchanged value of the foreign currency you can receive.
    """

    return budget / exchange_rate


def get_change(budget, exchanging_value):
    """
    Function calculates the amount of money that *is left* from the budget.

    :param budget: float - amount of money you own.
    :param exchanging_value: int - amount of your money you want to exchange now.
    :return: float - amount left of your starting currency after exchanging.
    """

    return budget - exchanging_value


def get_value_of_bills(denomination, number_of_bills):
    """
    function calculates only the total value of the bills that the booth would give back

    :param denomination: int - the value of a bill.
    :param number_of_bills: int - amount of bills you received.
    :return: int - total value of bills you now have.
    """

    return int(number_of_bills * denomination)


def get_number_of_bills(budget, denomination):
    """
    Function calculates the number of new currency bills that you can receive within the given budget.

    :param budget: float - the amount of money you are planning to exchange.
    :param denomination: int - the value of a single bill.
    :return: int - number of bills after exchanging all your money.
    """

    return int(budget / denomination)


def exchangeable_value(budget, exchange_rate, spread, denomination):
    """
    Function calculates the maximum value of the new currency after calculating the *exchange rate* plus the *spread*.

    :param budget: float - the amount of your money you are planning to exchange.
    :param exchange_rate: float - the unit value of the foreign currency.
    :param spread: int - percentage that is taken as an exchange fee.
    :param denomination: int - the value of a single bill.
    :return: int - maximum value you can get.
    """

    spread_decimal = (spread / 100) * exchange_rate
    new_exchange_rate = exchange_rate + spread_decimal
    exchanged = exchange_money(budget, new_exchange_rate)
    num_bills = get_number_of_bills(exchanged, denomination)
    return get_value_of_bills(denomination, num_bills)


def non_exchangeable_value(budget, exchange_rate, spread, denomination):
    """
    Function calculates the value that is *not* exchangeable due to the *denomination* of the bills.

    :param budget: float - the amount of your money you are planning to exchange.
    :param exchange_rate: float - the unit value of the foreign currency.
    :param spread: int - percentage that is taken as an exchange fee.
    :param denomination: int - the value of a single bill.
    :return: int non-exchangeable value.
    """

    spread_decimal = (spread / 100) * exchange_rate
    new_exchange_rate = exchange_rate + spread_decimal
    exchanged = exchange_money(budget, new_exchange_rate)
    num_bills = get_number_of_bills(exchanged, denomination)
    return int(exchanged - get_value_of_bills(denomination, num_bills))
