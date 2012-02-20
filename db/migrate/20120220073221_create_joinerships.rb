class CreateJoinerships < ActiveRecord::Migration
  def self.up
    create_table :joinerships do |t|
      t.integer :bid_id
      t.integer :joiner_id
      t.timestamps
    end
  end

  def self.down
    drop_table :joinerships
  end
end
