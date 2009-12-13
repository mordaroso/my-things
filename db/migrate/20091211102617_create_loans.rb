class CreateLoans < ActiveRecord::Migration
  def self.up
    create_table :loans do |t|
      t.integer :thing_id
      t.integer :person_id
      t.datetime :from
      t.datetime :to

      t.timestamps
    end
  end

  def self.down
    drop_table :loans
  end
end
