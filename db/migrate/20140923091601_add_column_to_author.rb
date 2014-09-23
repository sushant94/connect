class AddColumnToAuthor < ActiveRecord::Migration
  def change
    add_column :authors, :club_id, :integer
  end
end
