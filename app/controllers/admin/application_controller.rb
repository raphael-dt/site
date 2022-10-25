module Admin
    class ApplicationController < ::ApplicationController
        before_action :only_admin

        private
        def only_admin
            if !user_signed_in? || current_user.role.right != 'admin'
                redirect_to root_path, danger: "veuillez vous connecter ou vous inscrire pour accéder à cette page"
            end
        end
    end
end

        