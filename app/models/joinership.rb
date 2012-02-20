class Joinership < ActiveRecord::Base
  belongs_to :bid
  belongs_to :joiner, :class_name => "User"
  
  attr_accessible :bid_id, :joiner_id
end
