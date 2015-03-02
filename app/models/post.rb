# encoding: UTF-8
class Post < ActiveRecord::Base
    validates :title,:author,:content, presence: true
    validate :validate_event
    has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
    validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

    after_create :notify_users

    def validate_event
        if event
            if event_start.to_i < Time.now.to_i
                errors.add(:event_start, "cannot be before present.")
            end
        end
        return true
    end


    def notify_users
        filtered = self.content
        filtered.gsub!(/[^a-zA-Z0-9]/, "")
        `node send.js #{self.title} #{truncate(filtered, 30)}`
    end

end
