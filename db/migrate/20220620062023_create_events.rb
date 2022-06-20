class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :event_name,           null: false
      t.text :content,                null: false
      t.integer :prefecture_id,       null: false
      t.date :date,                   null: false
      t.text :official_link
      t.text :youtube_link
      t.text :instagram_link
      t.text :twitter_link
      t.references :user,             null: false, foreign_key: true

      t.timestamps
    end
  end
end
