module Admin
    class UsersController < ApplicationController
        def index
            @user=User.all
        end
        def destroy
            @user= User.find(params[:id])
            @user.destroy
            redirect_to admin_users_path, sucess: "l'utilisateur a été supprimé"
        end
        def passeditor
            @user=User.find(params[:id])
            if @user.update(role: 'editor')
                redirect_to admin_users_path, sucess: "l'utilisateur est devenu un editeur"
            else
                redirect_to admin_users_path, danger: "Echec, veuillez rééssayer"
            end
        end
        def passeditor
            @user=User.find(params[:id])
            if @user.update(role: 'editor')
                redirect_to admin_users_path, sucess: "l'utilisateur est devenu un editeur"
            else
                redirect_to admin_users_path, danger: "Echec, veuillez rééssayer"
            end
        end
        def passextern
            @user=User.find(params[:id])
            if @user.update(role: 'extern')
                redirect_to admin_users_path, sucess: "l'utilisateur est devenu un externe"
            else
                redirect_to admin_users_path, danger: "Echec, veuillez rééssayer"
            end
        end


        

    end
end
