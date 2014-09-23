class Post < ActiveRecord::Base
    has_one: :author
    has_and_belongs_to_many: :tags
end
