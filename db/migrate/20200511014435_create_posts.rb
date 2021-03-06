class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.text :reason
      t.string :youtube_url
      t.string :video
      t.references :genre, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
