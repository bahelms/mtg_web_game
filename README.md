# Magic: The Gathering Web Game

This app is my homemade, free version of MTG Online. 

###Development Setup 
    bundle exec rake db:migrate
    bundle exec rake db:seed
    bundle exec rake import_all_sets

###TODO

* DB
  * db/seeds: Formats, Types, Subtypes, Supertypes, Abilities, Sets
  * Rake tasks to add: Sets, Cards, Abilities

* Deck builder
* Game engine

* Lobby chat
  * Fix autoscrolling
  * Click on user and invite to game
  * Private chat?
