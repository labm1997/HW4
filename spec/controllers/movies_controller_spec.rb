require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  let(:movie_with_director) {
    {id: 1, title: "Some movie", director: "Some director", rating: "PG"}
  }  
  let(:movie_without_director) {
    {id: 1, title: "Some movie", director: nil, rating: "PG"}
  }

  describe "When the specified movie has a director"
    it "should call samedirectors method and should be success" do
      movie = Movie.create! movie_with_director
      get :samedirectors, params: {id: movie.id}
      expect(response).to be_success
    end
  describe "When the specified movie has no director"
    it "should call samedirectors method and should be success" do
      movie = Movie.create! movie_without_director
      get :samedirectors, params: {id: movie.id}
      expect(response).to be_success
    end
end
