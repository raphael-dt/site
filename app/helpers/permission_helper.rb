module PermissionHelper
    def canEdit
        
    end
    def isAdmin
        if user_signed_in? && current_user.role=== 'admin'
            true
        else
            false
        end

    end
end
    