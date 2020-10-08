class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :good_air_ventilation
      t.integer :staff_practicing_safe_covid_protocols
      t.integer :seats_far_apart
      t.boolean :outside_seating
      t.text :additional_comments
      t.belongs_to :user, foreign_key: true
      t.belongs_to :establishment, foreign_key: true
      t.timestamps
    end
  end
end
