module Admin
    class Admin::SignalementsController < ApplicationController
        def index
            @signalement=Signalement.all
        end
        def show
            @comment=Comment.find(params[:id])
            @signalement=@comment.signalement
        end
        def destroy
            @signalement=Signalement.find(params(:id))
            if @signalement.destroy
                redirect_to admin_signalement_path, sucess: "Le signalement a bien été supprimé"
            else
                redirect_to admin_signalement_path, danger: "la suppression a échoué"
            end
        end
        def resolve
            @comment=Comment.find(params[:id])
            @comment.signalement.status='resolve'
            @comment.update()
            if @comment.save
                redirect_to admin_signalement_path, sucess: "Le signalement a bien été résolu"
            else
                redirect_to admin_signalement_path, danger: "la résolution a échoué"
            end
        end
    end
end
