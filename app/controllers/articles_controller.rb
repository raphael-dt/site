class ArticlesController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "admin", except: [:index, :show]
  skip_before_action :only_signed_in, only: :index
  def index
    @article =Article.all
  end
  
  def show
    @article=Article.find(params[:id])
  end

  def new
      @article=Article.new
  end

  def create
    @article=Article.new(article_params)

    if @article.save
        redirect_to @article, success: "Votre article a été créé avec succès"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article =Article.find(params[:id])
  end

  def update
    @article =Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article, success: "Votre article a été modifié avec succès"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article=Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other, success: "Votre article a été supprimé avec succès"
  end


  private
    def article_params
      params.require(:article).permit(:title, :body, :status)
    end
end
