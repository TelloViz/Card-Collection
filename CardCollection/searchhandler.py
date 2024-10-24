from backend import Backend

class SearchHandler:
    """
    The SearchHandler class performs the heavy lifting for the searching functionality. This class contains the method handle_search, which calls methods from the Backend class to execute the search requested by the user.

    Methods:
        handle_search(search_parameters): Constructs a query string using the Backend class, construct_query function.
    """

    def handle_search(self, search_parameters: list[tuple[str, str, str]]) -> list[Card]:
        """
        A function that takes a list of tuples representing search parameters, constructs a query string using the Backend class, and retrieves a list of Card objects from the API.

        Args:
            search_parameters (List[Tuple[str, str, str]]): A list of tuples where each tuple contains:
                - category (str): The main category for the search.
                - subcategory (str): The subcategory to refine the search.
                - target (str): The search target (value being searched).

        Returns:
            list[Card]: A list of Card objects as search results.
        """
        query = construct_query(tupleList)
        
        return queryApi(query)