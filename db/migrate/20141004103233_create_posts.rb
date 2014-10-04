class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.integer :user_id
      t.string :author
      t.string :category
      t.text :content
      t.boolean :event
      t.datetime :event_start
      t.datetime :event_end
      t.string :venue

      t.timestamps
    end
  end
end
