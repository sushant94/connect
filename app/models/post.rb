class Post < ActiveRecord::Base
    validates :title,:author,:content, presence: true
    validate :validate_event
    has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
    validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

    def validate_event
        if event
            if event_start.to_i < Time.now.to_i
                errors.add(:event_start, "cannot be before present.")
            end
        end
        return true
    end

end
