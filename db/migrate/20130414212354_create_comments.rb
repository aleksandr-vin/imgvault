class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :body
      t.references :image

      t.timestamps
    end
    add_index :comments, :image_id
  end
end
