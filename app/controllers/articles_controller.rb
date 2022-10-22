class ArticlesController < ApplicationController
  skip_before_action :only_signed_in, only: :index
  def index
    @article =Article.all
  end
  
  def show
    @article=Article.find(params[:id])
  end
  private
    def article_params
      params.require(:article).permit(:title, :body, :status)
    end
end
