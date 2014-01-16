class CommentsController < ApplicationController

  http_basic_authenticate_with name: "admin", password: "secret",
                               only: :destroy

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment].permit(:commenter, :body))

    redirect_to post_path(@post)
  end

# -------------------------------------------------------
# Protected by http_basic_auth
# -------------------------------------------------------
  def destroy
    redirect_to index unless is_logged_in
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy

    redirect_to post_path(@post)
  end

end
