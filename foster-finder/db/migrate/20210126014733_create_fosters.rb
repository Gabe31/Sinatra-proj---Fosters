class CreateFosters < ActiveRecord::Migration
  def change
    create_table :fosters do |t|
      t.string :name
      t.string :location    
      t.string :animal
      t.integer :user_id
    end 
  end
end