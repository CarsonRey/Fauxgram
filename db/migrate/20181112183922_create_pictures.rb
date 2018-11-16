class CreatePictures < ActiveRecord::Migration[5.2]
  def change
    create_table :pictures do |t|
      t.string :description
      t.string :img_url
      t.integer :user_id
      t.timestamps
    end
  end
end
