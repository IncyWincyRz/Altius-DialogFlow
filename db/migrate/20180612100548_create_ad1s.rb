class CreateAd1s < ActiveRecord::Migration[5.2]
  def change
    create_table :ad1s do |t|
      t.string :review
      t.string :response

      t.timestamps
    end
  end
end
