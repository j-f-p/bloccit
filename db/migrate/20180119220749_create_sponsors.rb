class CreateSponsors < ActiveRecord::Migration[5.1]
  def change
    create_table :sponsors do |t|
      t.string :title
      t.text :body
      t.integer :price
      t.integer :topic_id

      t.timestamps
    end
    add_index :sponsors, :topic_id
  end
end
