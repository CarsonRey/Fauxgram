class CreatePictureHashtags < ActiveRecord::Migration[5.2]
  def change
    create_table :picture_hashtags do |t|
      t.integer :hashtag_id
      t.integer :picture_id
      t.timestamps
    end
  end
end
