from pokemontcgsdk import Card
from backend import Backend
from cardprocessor import CardProcessor

class SearchHandler:
    """
    The SearchHandler class performs the heavy lifting for the searching functionality. This class contains the method handle_search, which calls methods from the Backend class to execute the search requested by the user.

    Methods:
        handle_search(search_parameters): Constructs a query string using the Backend class, construct_query function.
    """

    def handle_search(self, search_parameters: list[tuple[str, str, str]]) -> list[dict[str, str]]:
        """
        A function that takes a list of tuples representing search parameters, constructs a query string using the Backend class, and retrieves a list of Card objects from the API.

        Args:
            search_parameters (List[Tuple[str, str, str]]): A list of tuples where each tuple contains:
                - category (str): The main category for the search.
                - subcategory (str): The subcategory to refine the search.
                - target (str): The search target (value being searched).

        Returns:
            list[dict[str, str]: A list of dictionaries:
                - key: card attribute defined by API
                - value: card data string for that attribute
        """

        query = Backend.construct_query(self, search_parameters)
        results = Backend.query_api(self, query)
        return self.handle_card_process(results)
    
    def handle_card_process(self, cards: list[Card]) -> list[dict[str, str]]:
        """
        A function that takes a list of tuples representing search parameters, constructs a query string using the Backend class, and retrieves a list of Card objects from the API.

        Args:
            cards: list[Card]: A list of Card objects as defined by the API
        Returns:
           list[dict[str, str]: A list of dictionaries:
                - key: card attribute defined by API
                - value: card data string for that attribute
        """
        
        return CardProcessor.process_cards(cards)

