class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :image
      t.text :title
      t.text :page
      t.text :line
      t.text :content
      t.timestamps
    end
  end
end