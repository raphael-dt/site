module Editor
    class ApplicationController < ::ApplicationController
        before_action :only_editor

        private
        def only_editor
            if !user_signed_in? || current_user.role.right != 'admin' ||current_user.role.right != 'editor'
                redirect_to root_path, danger: "veuillez vous connecter ou vous inscrire pour accéder à cette page"
            end
        end
    end
end

        