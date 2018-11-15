Given(/^that I am on "([^"]*)" movie more info page$/) do |title|
  @movie = Movie.find_by(title: title)
  visit movie_path(@movie)
end

Then(/^I should see "([^"]*)" on movie info page$/) do |director|
  expect(page).to have_content(director)
end

Then(/^I should see the movies:$/) do |table|
  table.hashes.each do |movie|
    expect(page).to have_content(movie[:title])
  end
end

