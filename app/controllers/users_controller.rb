class UsersController < ApplicationController
    skip_before_action :only_signed_in, only: [:create, :new]
    before_action :only_signed_out, only: [:create, :new]
    def new
        @user=User.new
    end
    def create
        @user=User.new(users_params)
        @user.role.create(role: 'extern')
        if @user.valid?
            @user.save
            session[:auth]={id: @user.id}
            redirect_to root_path, success: "Votre compte a Bien été créé"
        else
            redirect_to new_user_path, danger: 'Il y a eu une erreur veuillez réessayer'
        end
    end
    def edit
        
        @user= current_user
        
    end
    def update
        @user=current_user
        if @user.update(users_params)
            redirect_to root_path, success: "la modificaiton a bien marché"
        else
            render danger: "veuillez rééssayer"
        end
        
    end

    def index
        @user=User.all
    end
    
    def show

    end

    private
    def check
        if session[:auth]['status']!='admin'
            redirect_to index_path danger: 'connectez vous avant d\'accéder aux sessions'
        end
    end
    def users_params
        params.require(:user).permit(:name, :password, :password_confirmation, :role)

    end
    
    
end
