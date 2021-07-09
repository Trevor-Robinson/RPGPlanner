class CreatePcs < ActiveRecord::Migration[5.2]
  def change
    create_table :pcs do |t|
      t.string :name
      t.text :background
      t.references :campaign, foreign_key: true

      t.timestamps
    end
  end
end
