class CreateConfigurations < ActiveRecord::Migration
  def self.up
    create_table :configurations do |t|
      t.string :name
      t.string :value

      t.timestamps
    end

    add_index :configurations, :name
  end

  def self.down
    drop_table :configurations
  end
end
