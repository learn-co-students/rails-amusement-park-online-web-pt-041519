class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.integer :nausea, {limit: 5}
      t.integer :happiness, {limit: 5}
      t.integer :tickets
      t.integer :height
      t.boolean default: false
      t.timestamps
    end
  end
end
