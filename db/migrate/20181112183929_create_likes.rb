class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.integer :user_id
      t.integer :picture_id
      t.integer :icon_id
      t.timestamps
    end
  end
end


#gem paperclip
#gem activestorage
