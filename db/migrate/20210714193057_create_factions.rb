class CreateFactions < ActiveRecord::Migration[5.2]
  def change
    create_table :factions do |t|
      t.string :name
      t.string :faction_type
      t.integer :tier
      t.text :goal
      t.text :description
      t.text :notable_assets
      t.text :qirks
      t.text :situation
      t.references :campaign, foreign_key: true

      t.timestamps
    end
  end
end
