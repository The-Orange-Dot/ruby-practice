class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @articles = Article.find(params[:id])
  end

  def new
    @articles = Article.new
  end

  def create
    @articles = Article.new(articles_params)

    if @articles.save
      redirect_to @articles
    else
      render :new
    end
  end

  def edit
    @articles = Article.find(params[:id])
  end

  def update
    @articles = Article.find(params[:id])

    if @articles.update(articles_params)
      redirect_to @articles
    else
      render :edit
    end
  end

  def destroy
    @articles = Article.find(params[:id])
    @articles.destroy

    redirect_to root_path
  end

  private
    def articles_params
      params.require(:article).permit(:title, :body, :status)
    end

end
