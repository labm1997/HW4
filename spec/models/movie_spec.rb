require 'rails_helper'

RSpec.describe Movie, type: :model do
  let(:movie_with_director) {
    {id: 1, title: "Some movie", director: "Some director", rating: "PG"}
  }
  let(:another_movie_with_same_director) {
    {id: 2, title: "Some movie 2", director: "Some director", rating: "PG"}
  }  
  let(:another_movie_with_other_director) {
    {id: 3, title: "Some movie 3", director: "Another director", rating: "PG"}
  }  
  describe "Same directors search"
    it "should find movies by same director" do
      movie1 = Movie.create! movie_with_director
      movie2 = Movie.create! another_movie_with_same_director
      expect(Movie).to receive(:samedirectors).with(movie1).and_return([movie1, movie2])
      Movie.samedirectors(movie1)
    end
    it "should not find movies by different directors" do
      movie1 = Movie.create! movie_with_director
      movie2 = Movie.create! another_movie_with_other_director
      expect(Movie).to receive(:samedirectors).with(movie1).and_return([movie1])
      Movie.samedirectors(movie1)
    end
end
