class ArticlesController < ApplicationController
  before_action :only_editor, except: [:index, :show]
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
  def archived
    @article =Article.find(params[:id])
    if @article.update(status: 'archived')
      redirect_to @article, success: "l'article a bien été archivée"
    else
      redirect_to @article, danger: "une erreur s'est produite veuillez rééssayer"
    end
  end
  def activate
    @article =Article.find(params[:id])
    if @article.update(status: 'public')
      redirect_to @article, success: "l'article a bien été activé"
    else
      redirect_to @article, danger: "une erreur s'est produite veuillez rééssayer"
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
    def only_editor
      if !user_signed_in? || !(current_user.role = 'editor' || current_user.role = 'admin')
          redirect_to root_path, danger: "veuillez vous connecter ou vous inscrire pour accéder à cette page"
      end
  end
    
end
