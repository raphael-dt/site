module Admin::SignalementsHelper
    def resolve_route(comment, action)
        {'id'=>comment, 'action'=>action}        
    end
    
end
