class Joinership < ActiveRecord::Base
  belongs_to :bid
  belongs_to :joiner, :class_name => "User"
  
  attr_accessible :bid_id, :joiner_id

  validates_presence_of :bid_id, :joiner_id
  validate :not_owner
  validate :not_joiner

  def not_owner
    return unless self.bid_id and self.joiner_id
    
    if self.bid.user.id == self.joiner_id
      self.errors[:base] << 'You can not join your own Bid !'
    end
  end

  def not_joiner
    return unless self.bid_id and self.joiner_id 

    # TODO: 
    # 1. Try to make a simple query 
    # Joinership.exists?(:bid_id => 1, :joiner_id => 2)
    # 2. Try to use uniquee and force it into errors[:base]
    #
    @bid = Bid.find self.bid_id

    if @bid.joiners.exists?(self.joiner_id)
      self.errors[:base] << 'You already joined this Bid !'
    end
  end
end
