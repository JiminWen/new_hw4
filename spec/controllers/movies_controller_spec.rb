require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
     before(:each) do
      @movie = mock(Movie, :title => 'alien', :id => '1',:director => 'James')
      @hello.stub!(:say).and_return("hello world")
    end
    #describe 'same director' do
     # @fake=@movie
     # Movie.should_receive(:same_directors).with(:James).and_return(@fake)
    #  Movie.same_directors(:James)
   # end
end
