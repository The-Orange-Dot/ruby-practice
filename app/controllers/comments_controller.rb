class CommentsController < ApplicationController

  def create
    @articles = Article.find(params[:id])
    @comments = @articles.comments.create(comment_params)
    redirect_to articles_path(@articles)
  end

  private
    def comment_params
      params.requre(:comment).permit(:commenter, :body)
    end

end
