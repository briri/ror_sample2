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
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(params[:post].permit(:title, :text))
      redirect_to @post
    else
      render 'edit'
    end
  end

  def create
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
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end

private
  def post_params
    params.require(:post).permit(:title, :text)
  end

end
