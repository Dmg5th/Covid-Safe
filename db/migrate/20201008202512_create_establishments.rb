class CreateEstablishments < ActiveRecord::Migration[6.0]
  def change
    create_table :establishments do |t|
      t.string :name
      t.string :location
      t.belongs_to :category, foreign_key: true
      t.belongs_to :user, foreign_key: true
      t.timestamps
    end
  end
end
