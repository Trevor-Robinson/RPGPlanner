class CreateCampaigns < ActiveRecord::Migration[5.2]
  def change
    create_table :campaigns do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
