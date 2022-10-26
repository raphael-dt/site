class SignalementsController < ApplicationController
  def new
    @signalements= Signalement.new
    @comment=Comment.find(params[:comment])
  end

  def create
    @comment= Comment.find(params[:id])
    @signalements=@comment.signalement.create(params, user: session[:auth]['id'])
    if @signalement.save
      redirect_to article_path(@comment.article), sucess: "Votre signalement a bien été enregistrer nous allons bientot traiter votre demande."
    end
  end
  private
  def signalement_params
    params.require(:signalement).permit(:cause, :comment)    
  end
  
end
