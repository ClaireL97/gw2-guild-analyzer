class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :accountID
      t.string :rank #example of rank = leader, officer, member
      t.integer :guild_id


      t.timestamps
    end
  end
end
