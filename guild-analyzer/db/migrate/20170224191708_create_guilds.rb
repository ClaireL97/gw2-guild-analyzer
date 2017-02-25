class CreateGuilds < ActiveRecord::Migration[5.0]
  def change
    create_table :guilds do |t|
      t.string :name, null: false
      t.string :server, null: false
      t.string :wvw_playstyle
      t.integer :average_member_count
      t.string :guild_tag #finding via API

      t.timestamps
    end
  end
end
