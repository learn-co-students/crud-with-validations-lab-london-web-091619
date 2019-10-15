class Song < ApplicationRecord
    validates :title, presence: true, uniqueness: true
    validate :valid_year?
    validates :artist_name, presence: true

    def valid_year?
        unless released == false
            if release_year
                unless release_year <= Time.new.year
                    errors.add(:release_year, "Must have been released in the past")
                end
            else
                errors.add(:release_year, "Must have a release year if released")
            end
            
        end
    end

    def released?
        released
    end
end
