class ArticlesController < ApplicationController

  def index
    @articles = Article.includes(:publisher)
    @latest_articles = Article.order(created_at: :desc).limit(5)
    @random_articles = Article.order(Arel.sql('RANDOM()')).limit(5)
    
    @categories = Article.pluck(:category).uniq
    @articles_by_category = {}
    @categories.each do |category|
      @articles_by_category[category] = Article.where(category: category)
    end  
  end

  def show
    @article = Article.find(params[:id])
    @related_articles = Article.where(category: @article.category).where.not(id: @article.id)
  end

  def new
    @article = current_publisher.articles.build
  end
  
  def create
    @article = current_publisher.articles.build(article_params)

    if @article.save
      redirect_to @article, notice: "Article was sucessfully created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article, notice: "article was sucessfully updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path, notice: "Article was sucessfully deleted", status: :see_other
  end

  private
    def article_params
      params.require(:article).permit(:title, :article_photo, :content, :category)
    end
end
