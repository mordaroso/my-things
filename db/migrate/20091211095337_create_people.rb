class CreatePeople < ActiveRecord::Migration
  def self.up
    create_table :people do |t|
      t.string :name
      t.string :email
      t.string :address
      t.string :city
      t.string :zip_code
      t.string :phone

      t.timestamps
    end
  end

  def self.down
    drop_table :people
  end
end
