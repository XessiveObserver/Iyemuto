class NormalPagesController < ApplicationController
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
  def dashboard
  end
end
