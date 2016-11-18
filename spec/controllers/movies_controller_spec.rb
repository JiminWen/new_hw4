require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
     before(:each) do
     @movie = double(Movie, :title => 'alien', :id => '1',:director => 'James')
      allow(Movie).to receive(:find).with('1').and_return(@movie)
    end
    describe 'destroy' do
     it 'call method' do 
       # delete :destroy,{:id => '1'}
        expect(@movie).to receive(:destroy)
        delete :destroy, :id => '1'
     end
     it 'redirect_to' do
        allow(@movie).to receive(:destroy)
         delete :destroy, :id => '1'
        expect(response).to redirect_to(movies_path) 
     end
    end 
    describe 'create' do  
     it 'create redirect_to' do
         Movie.any_instance.stub(:valid?).and_return(true)
         post :create, :movie => {:title => 'alien', :director => 'James',:release_date=>" ",:rating=>" ",:description=>" "}
         assigns[:movie].should_not be_new_record
         flash[:notice].should_not be_blank
         response.should redirect_to(movies_path)
      
     end 
   
    end 
    describe 'edit' do
     it 
    end 
   
end
