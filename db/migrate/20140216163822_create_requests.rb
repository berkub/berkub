class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :full_name
      t.string :email
      t.float :price
      t.string :location
      t.string :rooms
      t.boolean :furnished
      t.boolean :through_agents
      t.text :extra

      t.timestamps
    end
  end
end
