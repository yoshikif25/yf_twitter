class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @article = "これは表示される内容が変わります"
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(set_params)
    if @article.valid?
      @article.save
      redirect_to root_path
    else
      redirect_to new_article_path
    end
  end

  private

  def set_params
    params[:article].permit(:tweet).merge(user_id: current_user.id)
  end
end
