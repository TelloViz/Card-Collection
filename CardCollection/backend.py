from pokemontcgsdk import Card, Set, RestClient

RestClient.configure('12345678-1234-1234-1234-123456789ABCD')

class Backend:
    """
    Summary:
        Handles all actual API interaction from constructing queries, to querying for data.
    """

    def construct_query(self, query_data: list[tuple[str, str, str]]) -> str:
        """
        Constructs a query string from the given search parameters.
        Args:
            search_parameters (list[tuple[str,str,str]]):
            A list of tuples representing the search parameters.

        Returns:
            str: The constructed query string.
        """

        # Initialize an empty dictionary to hold query parts
        query_parts = {}

        # Loop through each item in the queryData list
        for item in query_data:
            # Extract the category, subcategory, and target from the item
            category = item[0]
            subcategory = item[1]
            target = item[2]

            # Prepare the target for the query string with quotes
            target = f'"{target}"'  # Enclose target in quotes

            # If the category is not already in query_parts, create a new list for it
            if category not in query_parts:
                query_parts[category] = []

            # Check if subcategory is provided
            if subcategory:
                if category:
                    # Create a string in the format "category.subcategory:target" 
                    # and add it to the list
                    query_parts[category].append(f"{category}.{subcategory}:{target}")
                else:
                    # If no category, just "subcategory:target"
                    query_parts[category].append(f"{subcategory}:{target}")
            else:
                if category:
                    # Create a string in the format "category:target" 
                    # and add it to the list
                    query_parts[category].append(f"{category}:{target}")
                else:
                    # If no category or subcategory, just "target"
                    query_parts[category].append(target)

        # Prepare to construct the final query
        final_query_parts = []

        # Loop through each list of items in query_parts
        for items in query_parts.values():
            # If there is more than one item in the list
            if len(items) > 1:
                # Combine the items with "OR" and add parentheses around them
                final_query_parts.append(f"({' OR '.join(items)})")
            else:
                # If there's only one item, still wrap it in parentheses
                final_query_parts.append(f"({items[0]})")

        # Join all parts with "AND" to form the final query string
        final_query = " AND ".join(final_query_parts)
        return final_query

    def query_api(self, query: str) -> list[Card]:
        """
        Queries the Pokemon TCG API using the constructed query string.
        Args: 
            query (str): The query string to spend to the API.
            
        Returns: 
            list[Card]: A list of Card objects returned by the API.
        """
        return Card.where(q=query)

    def all_sets(self) -> list[Set]:
        """
        Retrieves all available sets from the Pokemon TCG API.
        
        Returns:
            list[Set]: A list of Set objects retrieved from the API.
        """
        return Set.all()

    def fetch_data(self, param_list : list[tuple[str,str,str]]) -> list[Card]:
        """
        ### Description
            Abstracts the logic for constructing a query
            and using it to query the API for card data.

        ### Args:
            self,
            param_list (list[tuple[str, str, str]]): 
                List of tuples of the form (category, subcategory, target)
        ### Returns:
            list[Card]
        """
        string = self.construct_query(param_list)        
        card_list = self.query_api(string)

        return card_list
