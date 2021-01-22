class Rescues < ActiveRecord::Migration
  def change
    create_table :rescues do |t|
      t.string :rescue_name
      t.string :rescue_breed
      t.integer :rescue_id
    end
  end
end