class Author < ActiveRecord::Base
    # An Author can belong to one club.
    # An Author writes many posts.
    # Each user is associated with an author.
    belongs_to: :club
    has_many: :posts
    has_one: :user
end
