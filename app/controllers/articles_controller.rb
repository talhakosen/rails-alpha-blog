class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :destroy, :show]

  def new
    @article = Article.new
  end

  def edit

  end

  def create
    debugger
    # @article = Article.new(article_params)
    # @article.save
    @article = Article.new(article_params)
    @article.user = User.first

    if @article.save
      flash[:success] = "Article was succesfully created"
      redirect_to article_path(@article)
    else
      # render :new
      render 'new'
    end
  end

  def update

    if @article.update(article_params)
      flash[:success] = "Article was succesfully updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def show
    @article = Article.all
  end

  def index
    @article = Article.all
  end

  def destroy

    @article.destroy
    flash[:danger] = "Article was succesfully deleted"
    redirect_to articles_path
  end

  private
  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end
end