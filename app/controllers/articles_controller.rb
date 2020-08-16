class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_article, only: :create_like

  def index
    @article = Article.new
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

  def create_like
    if user_signed_in? && @article.user_id != current_user.id && @article.likes.find_by(user_id: current_user.id) == nil
      Like.create(user_id: current_user.id, article_id: @article.id)
      Notification.create(notifying_id: @article.user_id, notified_by_id: current_user.id, article_id: @article.id)
      @like = "like"
    elsif user_signed_in? && @article.user_id != current_user.id && @article.likes.find_by(user_id: current_user.id) != nil
      Like.find_by(user_id: current_user.id, article_id: @article.id).destroy
      Notification.find_by(notifying_id: @article.user_id, notified_by_id: current_user.id, article_id: @article.id).destroy
      @like = "unlike"
    end
  end

  private

  def set_params
    params[:article].permit(:tweet).merge(user_id: current_user.id)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end