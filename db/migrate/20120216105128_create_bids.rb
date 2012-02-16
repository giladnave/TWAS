class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.string :title
      t.text :content
      t.integer :join_num
      t.date :valid_until

      t.timestamps
    end
  end
end
