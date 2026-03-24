# test_backend.py
# Created by Josh Lollis
# 10/19/2024

import time
from backend import Backend
from pokemontcgsdk import Card 

def test_construct_query():
    """
    Summary:
        Passes a set of test search data to Backend.construct_query, 
        then queries the api using them to test their validity. 
        Then the function returns the result count for each query, 
        and averages the response time per result.
    Args:
        None
    Return:
        None
    """

    backend = Backend()

    # Test data for testing the construct_query function
    test_data_sets = [
        [
            ('name', '', 'Pikachu'),
        ],
        [
            ('set', 'name', 'Base'),
            ('types', '', 'Electric'),
            ('types', '', 'Grass'),
        ],
        [
            ('set', 'name', 'Jungle'),
            ('', 'name', 'Jigglypuff'),
        ],
        [
            ('set', 'name', 'Team Rocket'),
            ('', 'name', 'Charmander'),
            ('types', '', 'Fire'),
            ('types', '', 'Dark'),
            ('types', '', 'Dragon'),
        ],
        [
            ('set', 'name', 'Neo Genesis'),
            ('set', 'name', 'Neo Discovery'),
            ('', 'name', 'Lugia'),
        ],
        [
            ('set', 'name', 'Aquapolis'),
            ('types', '', 'Water'),
            ('types', '', 'Fire'),
            ('types', '', 'Psychic'),
            ('types', '', 'Dragon'),
            ('types', '', 'Fairy'),
        ],
        [
            ('set', 'name', 'Fossil'),
            ('set', 'name', 'Base Set 2'),
            ('set', 'name', 'Skyridge'),
            ('', 'name', 'Mewtwo'),
        ],
        [
            ('name', '', 'Bulbasaur'),
            ('types', '', 'Grass'),
            ('types', '', 'Poison'),
            ('types', '', 'Psychic'),
            ('types', '', 'Fairy'),
        ],
        [
            ('set', 'name', 'Hidden Legends'),
            ('set', 'name', 'FireRed & LeafGreen'),
            ('set', 'name', 'Unseen Forces'),
            ('set', 'name', 'EX Trainer Kit Latios'),
        ],
        [
            ('set', 'name', 'Legendary Collection'),
            ('', 'name', 'Gengar'),
            ('types', '', 'Ghost'),
            ('types', '', 'Poison'),
            ('types', '', 'Psychic'),
            ('types', '', 'Dark'),
            ('types', '', 'Fairy'),
            ('types', '', 'Dragon'),
            ('types', '', 'Steel'),
        ],
        [
            ('name', '', 'Eevee'),
            ('types', '', 'Normal'),
            ('types', '', 'Fire'),
            ('types', '', 'Water'),
            ('types', '', 'Electric'),
            ('types', '', 'Psychic'),
            ('types', '', 'Dark'),
        ],
        [
            ('set', 'name', 'XY'),
            ('set', 'name', 'Hidden Fates'),
            ('types', '', 'Grass'),
            ('types', '', 'Fire'),
            ('types', '', 'Water'),
            ('types', '', 'Electric'),
            ('types', '', 'Psychic'),
            ('types', '', 'Dark'),
            ('types', '', 'Dragon'),
            ('types', '', 'Steel'),
            ('types', '', 'Fairy'),
            ('types', '', 'Fighting'),
            ('types', '', 'Colorless'),
        ],
        [
            ('set', 'name', 'Sun & Moon'),
            ('', 'name', 'Rowlet'),
        ],
        [
            ('set', 'name', 'Primal Clash'),
            ('set', 'name', 'Double Crisis'),
            ('set', 'name', 'Roaring Skies'),
            ('set', 'name', 'Ancient Origins'),
            ('set', 'name', 'BREAKthrough'),
        ],
        [
            ('set', 'name', "Champion's Path"),
            ('types', '', 'Grass'),
            ('types', '', 'Fire'),
            ('types', '', 'Water'),
            ('types', '', 'Electric'),
            ('types', '', 'Psychic'),
            ('types', '', 'Dark'),
            ('types', '', 'Dragon'),
            ('types', '', 'Steel'),
            ('types', '', 'Fairy'),
        ],
        [
            ('set', 'name', 'Cosmic Eclipse'),
            ('set', 'name', 'Unbroken Bonds'),
            ('', 'name', 'Charizard'),
            ('types', '', 'Fire'),
            ('types', '', 'Flying'),
            ('types', '', 'Dragon'),
        ],
        [
            ('name', '', 'Machamp'),
            ('types', '', 'Fighting'),
            ('types', '', 'Dark'),
        ],
        [
            ('set', 'name', 'Evolving Skies'),
            ('set', 'name', 'Fusion Strike'),
            ('set', 'name', 'Brilliant Stars'),
            ('types', '', 'Grass'),
            ('types', '', 'Fire'),
            ('types', '', 'Water'),
            ('types', '', 'Electric'),
            ('types', '', 'Dark'),
            ('types', '', 'Dragon'),
        ],
        [
            ('set', 'name', 'Astral Radiance'),
            ('set', 'name', 'Pokémon GO'),
            ('set', 'name', 'Lost Origin'),
            ('set', 'name', 'Silver Tempest'),
            ('set', 'name', 'Obsidian Flames'),
            ('', 'name', 'Snorlax'),
        ]
    ]

    total_time = 0
    total_results = 0

    # Process each test case
    for test_data in test_data_sets:
        # Skip overly broad filters (e.g., ones that just look for all types)
        if any(x[0] == 'types' and x[1] == '' for x in test_data):
            continue

        # Construct query
        test_query = backend.construct_query(test_data)

        # Start timing the API request
        start_time = time.time()

        # Query the API
        results = Card.where(q=test_query)

        # Measure the time taken
        elapsed_time = time.time() - start_time

        # Update total time and results
        total_time += elapsed_time
        total_results += len(results)

        # Output the results for this query
        print(f"Input Data: {test_data}")
        print(f"Constructed Query: {test_query}")
        print(f"Number of results: {len(results)}")
        print(f"Time taken: {elapsed_time:.2f} seconds\n")

    # Calculate average response time per result
    if total_results > 0:
        average_response_time = total_time / total_results
        print(f"Total time for all queries: {total_time:.2f} seconds")
        print(f"Total number of results: {total_results}")
        print(f"Average response time per result: {average_response_time:.4f} seconds\n")
    else:
        print("No results returned from any queries.")

if __name__ == "__main__":
    test_construct_query()
