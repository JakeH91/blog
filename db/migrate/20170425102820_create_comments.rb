class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :content
      t.string :author
      t.integer :likes
      t.integer :dislikes

      t.timestamps
    end
  end
end
