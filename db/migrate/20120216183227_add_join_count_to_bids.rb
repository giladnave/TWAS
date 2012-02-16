class AddJoinCountToBids < ActiveRecord::Migration
  def change
    add_column :bids, :join_count, :integer, :null => false, :default => 0
  end
end
