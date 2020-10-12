class Review < ApplicationRecord
    belongs_to :user
    belongs_to :establishment
    validates :good_air_ventilation, :staff_practicing_safe_covid_protocols, :seats_far_apart, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than: 6 }
    validates :establishment, uniqueness: { scope: :user, message: "This establishment has already been reviewed by you"}

end
