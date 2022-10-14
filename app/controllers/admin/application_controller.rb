module Admin
    class ApplicationController < ::ApplicationController
        before_filter :only_admin

        private
        def :only_admin
            def only_signed_in 
                if !user_signed_in? || current_user.role != 'admin'
                    redirect_to root_path, danger: "veuillez vous connecter ou vous inscrire pour accéder à cette page"
                end
            end
        end
    end
end

        