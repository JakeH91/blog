class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.text :content
      t.string :author
      t.date :date_of_event
      t.string :location
      t.integer :likes
      t.integer :dislikes

      t.timestamps
    end
  end
end
