class CommentsController < ApplicationController

    http_basic_authenticate_with name: "orange", password: "bananana", only: :destroy

  def create
    @articles = Article.find(params[:article_id])
    @comments = @articles.comments.create(comment_params)
    redirect_to @articles
  end

  def destroy
    @articles = Article.find(params[:article_id])
    @comment = @articles.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@articles)
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body, :status)
    end
end
