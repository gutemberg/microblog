class PostsController < ApplicationController
  before_action :authenticate_user!, :except => [:show, :index]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :description)
  end
end
