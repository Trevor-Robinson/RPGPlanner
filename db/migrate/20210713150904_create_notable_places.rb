class CreateNotablePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :notable_places do |t|
      t.references :system, foreign_key: true
      t.string :name
      t.text :description
      t.text :rule
      t.integer :wealth
      t.integer :crime
      t.integer :tech
      t.integer :weird

      t.timestamps
    end
  end
end
