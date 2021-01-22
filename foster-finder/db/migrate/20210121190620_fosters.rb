class Fosters < ActiveRecord::Migration
  def change
    create_table :fosters do |t|
      t.string :name
      t.string :location
      t.integer :user_id
    end
  end
end