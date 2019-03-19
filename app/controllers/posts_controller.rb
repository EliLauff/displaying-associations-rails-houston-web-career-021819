class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
		@categories = Category.all
	end

	def create
		@post = Post.create(strong_params(:title, :description, :category_id))
		redirect_to post_path(@post)
	end

	def edit
		@post = Post.find(params[:id])
		@categories = Category.all
	end

	def update
		@post = Post.find(params[:id])
		@post.update(strong_params(:title, :description, :category_id))
		redirect_to post_path(@post)
	end

	private

	def strong_params(*args)
		params.require(:post).permit(*args)
	end
end
