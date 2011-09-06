class AddParentToHeatspots < ActiveRecord::Migration
  def self.up
    add_column :heatspots, :heatmap_id, :integer
  end

  def self.down
    remove_column :heatspots, :heatmap_id
  end
end
