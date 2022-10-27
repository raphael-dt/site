module Admin
    class Admin::SignalementsController < ApplicationController
        def index
            @signalement=Signalement.all
        end
        def show
            @signalement=Signalement.find(params[:id])
            @comment=Comment.find(@signalement.comment)
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
            @signalement=Signalement.find(params[:id])
            @signalement.satus='resolve'
            @signalement.update(@signalement)
            if @signalement.save
                redirect_to admin_signalement_path, sucess: "Le signalement a bien été résolu"
            else
                redirect_to admin_signalement_path, danger: "la résolution a échoué"
            end
    end
end
