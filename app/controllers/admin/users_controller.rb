module Admin
    class UserController < ApplicationController
        def index
            @user=Users.all
        end
        def destroy
            @user= Users.find(params[:id])
            @user.destroy
            redirect_to _path, sucess: "l'utilisateur a été supprimé"
        end
        def passeditor
            @user=User.find(params[:id])
            if @user.update(role: 'editor')
                redirect_to _path, sucess: "l'utilisateur est devenu un editeur"
            else
                redirect_to _path, danger: "Echec, veuillez rééssayer"
            end
        end
        def passeditor
            @user=User.find(params[:id])
            if @user.update(role: 'editor')
                redirect_to _path, sucess: "l'utilisateur est devenu un editeur"
            else
                redirect_to _path, danger: "Echec, veuillez rééssayer"
            end
        end
        def passextern
            @user=User.find(params[:id])
            if @user.update(role: 'extern')
                redirect_to _path, sucess: "l'utilisateur est devenu un externe"
            else
                redirect_to _path, danger: "Echec, veuillez rééssayer"
            end
        end


        

    end
end
