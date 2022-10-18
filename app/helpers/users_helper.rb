module UsersHelper
    def passeditor(id)
        redirect_to admin_passeditor_users_path(id), method: :patch
    end 
end
