class AddHeatAndWantedLevelToSystems < ActiveRecord::Migration[5.2]
  def change
    add_column :systems, :heat, :integer, :default => 0
    add_column :systems, :wanted_level, :integer, :default => 0
  end
end
