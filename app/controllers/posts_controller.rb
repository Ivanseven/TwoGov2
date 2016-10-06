class PostsController < ApplicationController
	before_filter :authenticate_user!
	before_action :set_post, only: [:show, :edit, :update, :destroy]

	def new
		@post = Post.new
	end

	def edit
	end

	def show   
	end


	def create
      @post = current_user.posts.build(post_params)

	  if @post.save
	  	flash[:notice] = "Post is created successfully."
	    redirect_to @post
	  else
	  	flash[:alert] = "Error creating post."
	    render 'new'
	  end
	end

	def update
	  if @post.update(post_params)
	  	flash[:notice] = "Post is updated successfully."     
	    redirect_to @post
	  else
	    render 'edit'
	  end
	end

	def destroy
		Post.destroy(@post.id)
		flash[:notice] = "Post is deleted."
		redirect_to root_path
	end


	private
	def set_post
		@post = Post.find(params[:id])
	end

	def post_params
		params.require(:post).permit(:address, :description, :duration_type, :activity_type, :language_type, :search_tag)
	end
end


