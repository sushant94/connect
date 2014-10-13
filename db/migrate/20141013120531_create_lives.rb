class CreateLives < ActiveRecord::Migration
  def change
    create_table :lives do |t|
      t.string :title
      t.text :content
      t.integer :feed_id

      t.timestamps
    end
  end
end
