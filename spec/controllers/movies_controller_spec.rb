require 'spec_helper'

describe MoviesController do
	describe "Find by director"	 do
		it "Redirects to homepage when movie has no director" do

			movie = Movie.create({:director => "", :title=>"Movie title"})
			#params[:id] = movie.id
			get :find_by_director, id: movie.id  
			response.should redirect_to movies_path

		end

		it "Shows movies with similar director" do
			m1 = Movie.create({:director => "Test"});
			m2 = Movie.create({:director => "Test"});
			m3 = Movie.create({:director => "Test-other"});

			get :find_by_director, id: m1.id

			assigns(:movies).should eq([m1,m2])
		end

	end

end
