class CreateHeatspots < ActiveRecord::Migration
  def self.up
    create_table :heatspots do |t|
      t.float :lat
      t.float :long
      t.float :strength

      t.timestamps
    end
  end

  def self.down
    drop_table :heatspots
  end
end
