class SessionsController < ApplicationController
  skip_before_action :only_signed_in
  before_action :only_signed_out, except: :destroy
  def new
    @user=User.new
  end

  def create
    @user=User.where(name: users_params[:name]).first
    if @user && @user.authenticate(users_params[:password])
        session[:auth]=@user.to_session
        redirect_to root_path, success: "vous êtes bien connecté"
    else
      redirect_to new_session_path, danger: "Mot de passe ou identifiant incorect"
    end
    
  end

  def destroy
    session.destroy
    redirect_to root_path, success: "vous êtes maintenant déconnecté, veuillez vous connecter pour continuer"
  end
  private
  def users_params
    params.require(:user)

  end
  
end
