require 'rails_helper'
RSpec.describe Movie, type: :routing do
  describe 'direct URI to collect methods' do
    it '/' do
    expect(:get => '/').to route_to('movies#index') 
    end
    it 'index' do
    expect(:get => '/movies/').to route_to('movies#index')
    end
    it 'new' do
    expect(:get => '/movies/new/').to route_to('movies#new')
    end
    it 'update' do
    expect(:put => '/movies/1').to route_to(controller: "movies",action: "update",id: '1')
    end
    it 'show' do
    expect(:get => '/movies/1').to route_to(controller: "movies",action: "show",id: "1")
    end
    it 'edit' do
    expect(:get => '/movies/1/edit').to route_to(controller: "movies",action: "edit",id: "1")
    end
    it 'show' do
    expect(:delete => '/movies/1').to route_to(controller: "movies",action: "destroy",id: "1")
    end
    it 'same_director' do
    expect(:get => '/movies/1/same_director').to route_to(controller: "movies",action: "same_director",movie_id: "1")
    end
  end
end