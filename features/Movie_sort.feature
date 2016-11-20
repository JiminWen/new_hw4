Feature: sort movies

  As a movie buff
  So that I can sort movies
  

Background: movies in database

  Given the following movies exist:
  | title        | rating | director     | release_date |
  | Star Wars    | PG     | George Lucas |   1977-05-25 |
  | Blade Runner | PG     | Ridley Scott |   1982-06-25 |
  | Alien        | R      |              |   1979-05-25 |
  | THX-1138     | R      | George Lucas |   1971-03-11 |
Scenario: sort by title
  Given I am on the home page
  When I follow "Movie Title"
  Then I should find movies sorted by title
  
Scenario: sort by title
  Given I am on the home page
  When I follow "Release Date"
  Then I should find movies sorted by date