class CreateNpcs < ActiveRecord::Migration[5.2]
  def change
    create_table :npcs do |t|
      t.references :campaign, foreign_key: true
      t.string :name
      t.string :description
      t.string :want
      t.string :need
      t.string :unique_feature
      t.string :trait_1
      t.string :trait_2
      t.string :trait_3

      t.timestamps
    end
  end
end
