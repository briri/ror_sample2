require_relative '../../app/helpers/application_helper'

class PostsController < ApplicationController

#  http_basic_authenticate_with name: "admin", password: "secret",
#                               except: [:index, :show]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

# ------------------------------------------------------------
# Protected by http_basic_auth
# ------------------------------------------------------------
  def edit
    redirect_to index unless is_logged_in
    @post = Post.find(params[:id])
  end

  def new
    redirect_to index unless is_logged_in
    @post = Post.new
  end

  def update
    redirect_to index unless is_logged_in
    @post = Post.find(params[:id])

    if @post.update(params[:post].permit(:title, :text))
      redirect_to @post
    else
      render 'edit'
    end
  end

  def create
    redirect_to index unless is_logged_in
    # Examine the form post
    # render text: params[:post].inspect

    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render "new"
    end

  end

  def destroy
    redirect_to index unless is_logged_in
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end

private
  def post_params
    params.require(:post).permit(:title, :text)
  end

end
