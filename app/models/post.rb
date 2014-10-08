class Post < ActiveRecord::Base
    validates :title,:author,:content, presence: true
    validate :validate_event

    def validate_event
        if event
            if event_start.to_i < Time.now.to_i
                errors.add(:event_start, "cannot be before present.")
            end
        end
        return true
    end

end
