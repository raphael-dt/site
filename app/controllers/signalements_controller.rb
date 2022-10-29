class SignalementsController < ApplicationController
  def new
    @signalements= Signalement.new
    @comment=Comment.find(params[:comment])
  end

  def create
    @comment= Comment.find(params[:id])
    @signalements=Signalement.new(signalement_params(@comment.id))
    if @signalement.save
      redirect_to article_path(@comment.article), sucess: "Votre signalement a bien été enregistrer nous allons bientot traiter votre demande."
    end
  end
  private
  def signalement_params(comment)
    params_return=params.require(:signalement).permit(:cause)
    params_return['user_id']= session[:auth]['id']
    params_return['comment_id']= comment
    return params_return    
  end
  
end
