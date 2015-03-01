class AddLiveNewsToPosts < ActiveRecord::Migration
  def change
  	add_column :posts, :live_news, :integer, :default => 0
  end
end
