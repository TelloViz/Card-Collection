from pokemontcgsdk import Card
from typing import List, Tuple, Optional

class CollectionHandler:
   """
   CollectionHandler manages loading and saving a collection of Pokemon cards
   This class handles interactions with files or other storage mechanism to persis collections

   Methods:
        handle_collection_load(): Handles the public interface for loading a collection
        handle_collection_save(data: List[Tuple]): Handles the public interface for saving a collection
        load_collection_file(TBD): Handles internal logic for loading data from a file or source
        save_collection_file(data: TBD): Handles the interal logic for saving data to a file or source
    """

def handle_collection_load(self) -> List[Card]:
    """
    Public method to load a collection of Pokemon cards.

    Returns:
        List[Card]: A list of Card objects representing the loaded collection
    """

    collection = self.load_collection_file()
    return collection

def handle_collection_save(self, data: List[Tuple]) -> None;
    """
    Public method to save a collection of Pokemon cards

    Args:
        data (List[Tuple]): A list of tuples representing card data to save
    """

    self.save_collection_file(data)

def load_collection_file(self, source: Optional[str] = None) -> List[Card]:
    """
    Private method to load collection data from a file or source

    Args:
        source (Optional[str]): The source of the collection (e.g., file path)

    Returns:
        List[Card]: A list of Card objects representing the collection
    """

    def save_collection_file(self, data: List[Tuple], destination: Optional[str] = None) -> None:
        """
        Private method to save collection data to a file or destination

        Args:
            data(List[Tuple]): A list of tuples representing card data to save
            destination (Optional[str]): The destination for the collection (e.g., file path)
        """
