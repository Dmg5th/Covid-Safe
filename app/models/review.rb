class Review < ApplicationRecord
    belongs_to :user
    belongs_to :establishment
    validates :good_air_ventilation, :staff_practicing_safe_covid_protocols, :seats_far_apart, numericality: true
end
