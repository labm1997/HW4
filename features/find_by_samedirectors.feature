Feature: Add directors to movies
  
Scenario: Add director info to an existing movie
  Given the following movies exist:
  | title                   | rating | release_date |
  | Aladdin                 | G      | 25-Nov-1992  |
  And that I am on "Aladdin" movie more info page
  And I follow "Edit"
  When I fill in "movie[director]" with "New director"
  And I press "Update Movie Info"
  Then I should see "New director" on movie info page

Scenario: Find movies by same director happy path
  Given the following movies exist:
  | title                   | rating | release_date | director   |
  | Aladdin                 | G      | 25-Nov-1992  | Director 1 |
  | The Terminator          | R      | 26-Oct-1984  | Director 2 |
  | When Harry Met Sally    | R      | 21-Jul-1989  | Director 1 |
  And that I am on "Aladdin" movie more info page
  When I follow "Find Movies With Same Director"
  Then I should see the movies:
  | title                   | rating | release_date | director   |
  | Aladdin                 | G      | 25-Nov-1992  | Director 1 |
  | When Harry Met Sally    | R      | 21-Jul-1989  | Director 1 |

Scenario: Find movies by same director sad path
  Given the following movies exist:
  | title                   | rating | release_date |
  | Aladdin                 | G      | 25-Nov-1992  |
  And that I am on "Aladdin" movie more info page
  When I follow "Find Movies With Same Director"
  Then I should see "No director information"
