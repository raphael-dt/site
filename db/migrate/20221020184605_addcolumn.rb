class Addcolumn < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :password_salt
    add_foreign_key :articles, :user
    add_foreign_key :comments, :user
    rename_column :comments, :commenter, :title

    create_table :tags do |t|
      t.string :name
      t.string :class    
      t.timestamps
    end
    create_table :signalements do |t|
      t.belongs_to :users, class_name: "users", foreign_key: "users_id"
      t.belongs_to :comments, class_name: "comments", foreign_key: "comments_id"
      t.string :cause
      t.boolean :status
      t.timestamps
    end
    create_table :roles , id: false do |t|
      t.belongs_to :users, class_name: "users", foreign_key: "users_id"
      t.string :role
      t.timestamps
    end
    create_table :tags_articles, id: false do |t|
      t.belongs_to :articles, class_name: "articles", foreign_key: "articles_id"
      t.belongs_to :tags, class_name: "tags", foreign_key: "tags_id"
      t.timestamps
    end
    
    

    
    

  end
end
