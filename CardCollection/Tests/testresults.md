```bash
~/Desktop/cc/Card-Collection/CardCollection$ python3
Python 3.9.7 (default, Sep 29 2024, 14:13:07) 
[GCC 13.2.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> from test_backend import test_construct_query
>>> test_construct_query()
Input Data: [('name', '', 'Pikachu')]
Constructed Query: (name:"Pikachu")
Number of results: 167
Time taken: 5.84 seconds

Input Data: [('set', 'name', 'Jungle'), ('', 'name', 'Jigglypuff')]
Constructed Query: (set.name:"Jungle") AND (name:"Jigglypuff")
Number of results: 1
Time taken: 1.23 seconds

Input Data: [('set', 'name', 'Neo Genesis'), ('set', 'name', 'Neo Discovery'), ('', 'name', 'Lugia')]
Constructed Query: (set.name:"Neo Genesis" OR set.name:"Neo Discovery") AND (name:"Lugia")
Number of results: 1
Time taken: 1.12 seconds

Input Data: [('set', 'name', 'Fossil'), ('set', 'name', 'Base Set 2'), ('set', 'name', 'Skyridge'), ('', 'name', 'Mewtwo')]
Constructed Query: (set.name:"Fossil" OR set.name:"Base Set 2" OR set.name:"Skyridge") AND (name:"Mewtwo")
Number of results: 1
Time taken: 1.13 seconds

Input Data: [('set', 'name', 'Hidden Legends'), ('set', 'name', 'FireRed & LeafGreen'), ('set', 'name', 'Unseen Forces'), ('set', 'name', 'EX Trainer Kit Latios')]
Constructed Query: (set.name:"Hidden Legends" OR set.name:"FireRed & LeafGreen" OR set.name:"Unseen Forces" OR set.name:"EX Trainer Kit Latios")
Number of results: 373
Time taken: 11.88 seconds

Input Data: [('set', 'name', 'Sun & Moon'), ('', 'name', 'Rowlet')]
Constructed Query: (set.name:"Sun & Moon") AND (name:"Rowlet")
Number of results: 1
Time taken: 1.43 seconds

Input Data: [('set', 'name', 'Primal Clash'), ('set', 'name', 'Double Crisis'), ('set', 'name', 'Roaring Skies'), ('set', 'name', 'Ancient Origins'), ('set', 'name', 'BREAKthrough')]
Constructed Query: (set.name:"Primal Clash" OR set.name:"Double Crisis" OR set.name:"Roaring Skies" OR set.name:"Ancient Origins" OR set.name:"BREAKthrough")
Number of results: 576
Time taken: 18.12 seconds

Input Data: [('set', 'name', 'Astral Radiance'), ('set', 'name', 'Pokémon GO'), ('set', 'name', 'Lost Origin'), ('set', 'name', 'Silver Tempest'), ('set', 'name', 'Obsidian Flames'), ('', 'name', 'Snorlax')]
Constructed Query: (set.name:"Astral Radiance" OR set.name:"Pokémon GO" OR set.name:"Lost Origin" OR set.name:"Silver Tempest" OR set.name:"Obsidian Flames") AND (name:"Snorlax")
Number of results: 3
Time taken: 1.44 seconds

Total time for all queries: 42.19 seconds
Total number of results: 1123
Average response time per result: 0.0376 seconds
```