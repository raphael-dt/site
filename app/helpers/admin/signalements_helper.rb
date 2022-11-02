module Admin::SignalementsHelper
    def resolve_route(comment, action)
        {'id'=>comment, 'action'=>action}        
    end
    def color(signalement)
        if !signalement.status.nil? && signalement.status
            "table-sucess"
        else
            "table-warning"
        end
    end
    
    
end
