module ArticlesHelper
    def canShow(article)
        
        if article.status=='public'
            true
        elsif isAdmin
            true
        elsif isEditor && (article.status=='archived' || article.editor==current_user.id)
            true                      
        else           
            false
        end
                
    end
    def actionStatus(article)
        if article.status=='public'    
            action={'name' => 'Archiver', 'linkroute' => archived_article_path(article.id)}
        else
            action= {'name' => 'Activer', 'linkroute'=> activate_article_path(article.id)}
            
        end
        return action
    end

    
end
