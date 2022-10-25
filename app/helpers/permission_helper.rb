module PermissionHelper
    def canEdit(post)
        if user_signed_in? && @post.edit_id === current_user.id
            true
        else
            false
        end
    end
    def isEditor
        if user_signed_in? && current_user.role === 'editor' || isAdmin
            true
        else
            false
        end
    end
    def isAdmin
        if user_signed_in? && current_user.role=== 'admin'
            true
        else
            false
        end

    end
end
    