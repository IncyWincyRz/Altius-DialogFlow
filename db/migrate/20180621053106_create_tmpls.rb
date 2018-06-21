class CreateTmpls < ActiveRecord::Migration[5.2]
  def change
    create_table :tmpls do |t|
      t.string :intent
      t.text :Gtemp, array: true, default: []
      t.text :Ptemp, array: true, default: []

      t.timestamps
    end
  end
end
