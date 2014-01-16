class PostsController < ApplicationController

  def new

  end

  def create
    # Examine the form post
    # render text: params[:post].inspect

    @post = Post.new(params[:post])
    @post.save

    redirect_to @post
  end

end
