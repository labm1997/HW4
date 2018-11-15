Feature: User can manually add movie

Scenario: Add a movie
	Given I am on the RottenPotatoes home page
	When I follow "Add new movie"
	Then I should be on the Create New Movie page
	When I fill in "movie[title]" with "Men in Black"
	And I fill in "movie[director]" with "Director of Men in Black"
	And I select "PG-13" from "movie[rating]"
	And I press "Save Changes"
	Then I should be on the RottenPotatoes home page
	And I should see "Men in Black"
