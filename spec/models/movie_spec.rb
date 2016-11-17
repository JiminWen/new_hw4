require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe 'find movies with the same director' do
    before :each do
          @movie_director=Movie.find_by_title('Star War').director
          @fake_res=Movie.find(1)      
        end      
    it 'can call movies with same director' do
        Movie.should_receive(:same_directors).with('James').and_return(@fake_res)
        post :same_directors, {:director => 'James'}
    end
  end
end
