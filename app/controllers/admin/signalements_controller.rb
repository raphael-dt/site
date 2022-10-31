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
            if params[:action]=='comment'
                test_commment=down_comment(params[:id])
            else
                test_comment=true
            end
            test_resolve=resolve_signalement(params[:id])
            if test_resolve && test_comment
                redirect_to admin_signalement_path, sucess: "Le signalement a bien été résolu"
            else
                redirect_to admin_signalement_path, danger: "la résolution a échoué"
            end
        end
        private
        def resolve_signalement(comment)
            @signalement=Signalement.where(comment_id: comment)
            @signalement.update(status: true)

        end
        def down_comment(comment)
            @comment=Comment.find(comment)
            @comment=@comment.update(status: 'private')  
            @comment.save                       
        end
        
        
    end
end
