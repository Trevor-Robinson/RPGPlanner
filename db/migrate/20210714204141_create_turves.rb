class CreateTurves < ActiveRecord::Migration[5.2]
  def change
    create_table :turves do |t|
      t.references :system, foreign_key: true
      t.references :faction, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
