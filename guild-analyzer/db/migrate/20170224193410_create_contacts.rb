class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :contact_alias, null: false
      t.string :rank, null: false
      t.references :guild, foreign_key: true
      t.timestamps

    end
  end
end
