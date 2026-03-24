from pokemontcgsdk import Set
import backend

class InitHandler:
    """
    Handles any front end requests for requesting data for the front end to initalize components.
    """

    def handle_sets_retrieve(self) -> list[Set]:
        """
        Description:
            Provide an interface for the front end to retrieve all available sets.
        Args:
            params none
        Returns:
            list[Set]
        """

        # call backend's all_sets function to retrieve sets
        return backend.Backend.all_sets(self)

       
