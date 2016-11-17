require 'rails_helper'
describe Movie do
  describe 'searching similar directors' do
    it 'same_directors can be called' do
      Movie.should_receive(:same_directors).with('Alien')
      Movie.same_directors('Alien')
    end
  end
end