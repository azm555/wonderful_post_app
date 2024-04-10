class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)

      if @article.save
        redirect_to article_url(@article), notice: "article was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
  end

  def update
    @article = Article.find(params[:id])

      if @article.update(article_params)
        redirect_to article_url(@article), notice: "article was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
  end

  def destroy
    @article = Article.find(params[:id])

    @article.destroy
    redirect_to articles_url, notice: "article was successfully destroyed."
  end

  private
    def article_params
      params.require(:article).permit(:title, :content)
    end

end
