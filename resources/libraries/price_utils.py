def sum_prices_matches_total(price_texts, expected_total_text):
    """
    Verifies that a list of price strings (e.g. ['$29.99', '$9.99'])
    sums up to match an expected total string (e.g. 'Item total: $39.98').

    Robot Framework calls this function as a keyword named
    'Sum Prices Matches Total' (underscores become spaces automatically).
    """
    individual_prices = [_parse_price(price) for price in price_texts]
    calculated_sum = round(sum(individual_prices), 2)

    expected_total = _parse_price(expected_total_text)

    if calculated_sum != expected_total:
        raise AssertionError(
            f"Price mismatch: individual items summed to {calculated_sum}, "
            f"but displayed total was {expected_total}"
        )

    return calculated_sum


def _parse_price(price_string):
    """Strips currency symbols and labels, returns a float."""
    cleaned = price_string.replace("Item total: ", "").replace("$", "").strip()
    return float(cleaned)