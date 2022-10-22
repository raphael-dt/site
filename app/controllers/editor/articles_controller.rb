class Editor::ArticlesController < ApplicationController
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
    def archived
        @article =Article.find(params[:id])
        if @article.update(status: 'archived')
          redirect_to @article, success: "l'article a bien été archivée"
        else
          redirect_to @article, danger: "une erreur s'est produite veuillez rééssayer"
        end
    end
    def actived
        @article =Article.find(params[:id])
        if @article.update(status: 'public')
          redirect_to @article, success: "l'article a bien été rendu public"
        else
          redirect_to @article, danger: "une erreur s'est produite veuillez rééssayer"
        end
    end
    private
    def article_params
      params.require(:article).permit(:title, :body, :status)
    end
end
