class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    add_flash_types :success, :danger
    before_action :only_signed_in
    helper_method :current_user, :user_signed_in?
    private
    def only_signed_in
        if !user_signed_in?
            redirect_to root_path, danger: "veuillez vous connecter ou vous inscrire pour accéder à cette page"
        end
    end
    
    def current_user
        return nil if !session[:auth] || !session[:auth]['id']
        return @_user if @_user
        @_user = User.find(session[:auth]['id'])        
    end
    def user_signed_in?
        !current_user.nil?
    end
    def only_signed_out
        if !current_user.nil?
            redirect_to root_path, danger: "vous êtes déjà connecté"
        end
    end
    

    
    
end
