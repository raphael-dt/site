class CommentsController < ApplicationController
    def create
      @article = Article.find(params[:article_id])
      @comment = @article.comment.create(comment_params)
      redirect_to article_path(@article), success: "Votre commentaire a été créé avec succès"
    end
    def destroy
      @article=Article.find(params[:article_id])
      @comment=@article.comment.find(params[:id])
      @comment.destroy
      redirect_to article_path(@article), success: "Votre commentaire a été supprimé avec succès"
    end
      private
        def comment_params
          params_return=params.require(:comment).permit(:title, :body, :status)
          params_return['user_id']= session[:auth]['id']
          return params_return
        end
end
