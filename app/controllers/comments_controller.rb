class CommentsController < ApplicationController

  def create
    @articles = Article.find(params[:article_id])
    @comments = @articles.comments.create(comment_params)
    redirect_to @articles
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end

end
