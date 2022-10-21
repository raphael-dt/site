class AddRoleToUsers < ActiveRecord::Migration[7.0]
  def change
    add_belongs_to :articles, :user
    add_belongs_to :comments, :user
    rename_column :comments, :commenter, :title

    create_table :tags do |t|
      t.string :name
      t.string :class    
      t.timestamps
    end
    create_table :signalements do |t|
      t.belongs_to :users 
      t.belongs_to :comments
      t.string :cause
      t.boolean :status
      t.timestamps
    end
    create_table :roles , id: false do |t|
      t.belongs_to :users
      t.string :role
      t.timestamps
    end
    create_table :tags_articles, id: false do |t|
      t.belongs_to :articles
      t.belongs_to :tags
      t.timestamps
    end
  end
end
