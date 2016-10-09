class PagesController < ApplicationController
	def search
  	# place in postings controller?s
  	if !params[:activity].nil?
  		activities = params[:activity].keys.join(" ")
  	end
  	if !params[:language].nil?
  		languages = params[:language].keys.join(" ")
  	end
  	if !params[:duration].nil?
  		durations = params[:duration].keys.join(" ")
  	end
  		# times
  		# genders
      # age
  		# persons
	    search = "#{params[:location]} #{activities} #{languages} #{durations}"
	    @posts = Post.search_by_columns(search)
	    # @posts.users.where(gender:params[:gender], age:params[:age])
	    @activities_bar = Activity.all
	  	render "posts/index"
	end
end
