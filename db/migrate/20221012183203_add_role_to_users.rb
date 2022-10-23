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
      t.belongs_to :user
      t.belongs_to :comment
      t.string :cause
      t.boolean :status
      t.timestamps
    end
    create_table :roles , id: false do |t|
      t.belongs_to :user
      t.string :right
      t.timestamps
    end
    create_table :tags_articles, id: false do |t|
      t.belongs_to :article
      t.belongs_to :tag
      t.timestamps
    end
  end
end
