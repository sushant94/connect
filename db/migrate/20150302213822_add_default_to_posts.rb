class AddDefaultToPosts < ActiveRecord::Migration
  def change
  	change_column :posts, :author, :string, :default => "Live News Writer"
  	change_column :posts, :category, :string, :default => "Live News"
  	change_column :posts, :event, :boolean, :default => false
  	change_column :posts, :event_start, :datetime, :default => Time.now
  	change_column :posts, :venue, :string, :default => "NITK"
  end
 end
