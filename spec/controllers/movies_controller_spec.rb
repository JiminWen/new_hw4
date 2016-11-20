require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
     before(:each) do
     @movie1 =Movie.create(:title => 'alien',:director => 'James') 
     @movie2=Movie.create(:title => 'Star War') 
    
     #double(Movie, :title => 'alien', :id => '1',:director => 'James')
      #allow(Movie).to receive(:find).with('1').and_return(@movie)
    end
    describe 'destroy' do
     it 'should delete item' do 
       expect{ 
        delete :destroy, id: @movie1.id
        }.to change(Movie,:count).by(-1) 
     end
     it 'redirect_to' do
        allow(@movie1).to receive(:destroy)
         delete :destroy, :id => '1'
        expect(response).to redirect_to(movies_path) 
     end
    end 
    describe 'create' do  
     it 'can create' do
       expect{ post :create, :movie => {:title => 'alien', :director => 'James',:release_date=>" ",:rating=>" ",:description=>" "}
              }.to change(Movie,:count).by(1) 
     end
     it 'create redirect_to' do
       Movie.any_instance.stub(:valid?).and_return(true)
       post :create, :movie => {:title => 'alien', :director => 'James',:release_date=>" ",:rating=>" ",:description=>" "}
       assigns[:movie].should_not be_new_record
       flash[:notice].should_not be_blank
       expect(response).to redirect_to(movies_path)
      
     end 
   
    end 
    describe 'update' do
    it "allows an movie to be updated" do
    put :update, id: @movie1.id, movie: { director: 'Ridley Scott' }
        @movie1.reload()
        expect(@movie1.director).to eq("Ridley Scott")
    end
    it "redirect_to to the homepage" do
     
    put :update, id: @movie2.id, movie: { director: 'Ridley Scott' }
    expect(response).to redirect_to(movie_path(@movie2))
    end
   end
    describe 'index' do
     it 'reders index template' do
       get :index
       expect(response).to render_template("index")
       
     end
    end
    describe 'new' do 
     it 'renders the new template' do
      get :new 
       expect(response).to render_template("new")
    end
    end
    describe 'show' do
     it 'renders the show template' do
       get :show,movie: @movie1,id:@movie1.id 
       expect(response).to render_template("show")
     end
    end
    describe 'find movies with the same director' do
     before(:each) do
     @movie3 =Movie.create(:title => 'alien',:director => 'Harden') 
     @movie4=Movie.create(:title => 'Star War') 
     @movie5 =Movie.create(:title => 'Spider man',:director => 'Harden') 
     #double(Movie, :title => 'alien', :id => '1',:director => 'James')
      #allow(Movie).to receive(:find).with('1').and_return(@movie)
    end
       
       describe 'happy path' do
          it 'should render the template for showing the movies with the same director' do
             get :same_director, :movie => @movie3 ,:format =>@movie3.id
             expect(response).to render_template("same_director")
          end
          
          it 'should find the movie with the same director' do
             @movies=Movie.same_directors(@movie3.director)
             expect(@movies).to eq([@movie3,@movie5])
          end
       end
       describe 'sad path' do
         it 'return to homepage' do
           get :same_director, :movie => @movie4 ,:format =>@movie4.id
           expect(response).to redirect_to(movies_path)
         end
         it 'shows a message' do
           get :same_director, :movie => @movie4 ,:format =>@movie4.id
           expect(flash[:notice]).to eq("'#{Movie.find(@movie4.id).title}' has no director info"  )
         end
       end
       
       
    end
end
