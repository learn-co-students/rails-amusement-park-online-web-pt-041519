class CreateAttractions < ActiveRecord::Migration[5.2]
  def change
    create_table :attractions do |t|
      t.string :name
      t.integer :tickets
      t.integer :nausea_rating, {limit: 5}
      t.integer :happiness_rating, {limit: 5}
      t.integer :min_height

      t.timestamps
    end
  end
end
