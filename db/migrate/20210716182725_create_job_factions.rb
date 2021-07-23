class CreateJobFactions < ActiveRecord::Migration[5.2]
  def change
    create_table :job_factions do |t|
      t.references :job, foreign_key: true
      t.references :faction, foreign_key: true
      t.text :note

      t.timestamps
    end
  end
end
