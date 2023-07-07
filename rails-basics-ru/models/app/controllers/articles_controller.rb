class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    pp @articles
  end

  def show
    @article = Article.find(params[:id])
  end
end
