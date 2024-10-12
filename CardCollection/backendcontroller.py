

from PySide6.QtCore import QObject, Slot, Signal

from pokemontcgsdk import Card
from pokemontcgsdk import Set
from pokemontcgsdk import Type
from pokemontcgsdk import Supertype
from pokemontcgsdk import Subtype
from pokemontcgsdk import Rarity

class BackendController(QObject):
    """
    Handles any front end requests for backend interaction.

    Args:
        QObject (_type_): Inheritance of QObject allows for the use of QT Signals and Slots
    """
    jsonSearchResults = Signal(str)  # Signal that emits JSON string
    jsonDiscoverResults = Signal(str)  # Signal that emits JSON string
    jsonLoadResults = Signal(str)  # Signal that emits JSON string

    @Slot(list)
    def request_search(self, params: list[tuple[str, str, str]]):
        """
        Provide an interface for the front end to make search requests with the given search parameters.

        Args:
            params (list[tuple[str, str, str]]): List of search parameter tuples of the form (category, subcategory, target)
        """

    @Slot(list)
    def request_discover(self, params: list[tuple[str,str,str]]):
        """
        Provide an interface for the front end to make discover requests with the given parameters.
        
        Args:
            params (list[tuple[str, str, str]]): List of search parameter tuples of the form (category, subcategory, target)
        """

    @Slot()
    def request_load_collection(self):
        """
        Provide an interface for the front end to request teh back end to load and return the user's collection.
        
        Args:
            none: This function does not take any arguments.
        """
        
    @Slot(list)
    def request_save_collection(self, params: list[tuple[str, str, str]]):
        """
        Provide an interface for the front end to save users collection to system using the given parameters.
        
        Args:
            params (list[tuple[str, str, str]]): List of tuples of the form (category, subcategory, target) representing the users collection.
        """
        
