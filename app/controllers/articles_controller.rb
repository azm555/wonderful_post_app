class ArticlesController < ApplicationController
  #  skip_before_action :authenticate_user!, only: %i[ index show ]
   before_action :set_article, only: %i[ edit update destroy ]

  def index
    @articles = Article.all.page(params[:page])
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    # if current_user == @article.user
      # render :edit
      # redirect_to articles_path
    # end
  end

  def create
    @article = current_user.articles.new(article_params)

      if @article.save
        redirect_to article_url(@article), notice: "#{t('activerecord.models.article')}が作成されました。"
      else
        render :new, status: :unprocessable_entity
      end
  end

  def update
      if @article.update(article_params)
        redirect_to article_url(@article), notice: "#{t('activerecord.models.article')}が更新されました。"
      else
        render :edit, status: :unprocessable_entity
      end
  end

  def destroy
    @article.destroy
    redirect_to articles_url, notice: "#{t('activerecord.models.article')}が削除されました。"
  end

  private
    def set_article
      @article = current_user.articles.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :content)
    end

end
