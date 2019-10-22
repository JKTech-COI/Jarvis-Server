from operator import itemgetter
from typing import Sequence, Optional, Callable, Tuple


def extract_properties_to_lists(
    key_names: Sequence[str],
    data: Sequence[dict],
    extract_func: Optional[Callable[[dict], Tuple]] = None,
) -> dict:
    """
    Given a list of dictionaries and names of dictionary keys
    builds a dictionary with the requested keys and values lists
    :param key_names: names of the keys in the resulting dictionary
    :param data: sequence of dictionaries to extract values from
    :param extract_func: the optional callable that extracts properties
    from a dictionary and put them in a tuple in the order corresponding to
    key_names. If not specified then properties are extracted according to key_names
    """
    value_sequences = zip(*map(extract_func or itemgetter(*key_names), data))
    return dict(zip(key_names, map(list, value_sequences)))