import random
from collections import defaultdict
from pokemontcgsdk import Card
from backend import Backend
from cardprocessor import CardProcessor

class DiscoverHandler:
    """
    DiscoverHandler Class:

    Summary:
        The `DiscoverHandler` class provides methods to discover a
        single random card based on search criteria.
        The class uses `Backend.fetch_data` to retrieve data and
        `CardProcessor.process_cards` for data processing.

    Methods:
        handle_discover:
            Returns a single card matching randomized criteria from a list of possible parameters.
            If no cards are found for the selected criteria, the function retries with new random
            criteria until a valid card is found

        random_select_set:
            Randomly selects a set from the input list of sets.

        random_select_type:
            Randomly selects a type from the input list of types.
    """

    def handle_discover(self, param_list: list[tuple[str, str, str]]) -> list[dict[str, str]]:
        # Initialize processed_cards to empty to enter the loop
        processed_cards = []

        while not processed_cards:
            # Perform random selection of parameters
            randomSelect = DiscoverHandler.random_select(param_list)

            # Check if the selected type is available within the selected set
            query = Backend.construct_query(self, randomSelect)

            # Run the query with the current random selection
            results = Backend.query_api(self, query)
            processed_cards = CardProcessor.process_cards(results)

        # Select a random card from the processed results
        randomChoice = [random.choice(processed_cards)]
        return randomChoice

    def random_select(select_list: list[tuple[str, str, str]]) -> list[tuple[str, str, str]]:
        """
        Summary:
            Builds a list containing one randomly selected tuple from each unique category (first element of each tuple).

        Args:
            select_list : A list[tuple[str, str, str]] representing the available items,
                          where each tuple's first element represents a category.

        Return:
            A list[tuple[str, str, str]] with one randomly selected item from each category.
        """

        # Group items by category
        category_dict = defaultdict(list)
        for item in select_list:
            category_dict[item[0]].append(item)

        # Randomly select one item per category
        result = [random.choice(items) for items in category_dict.values()]

        return result
