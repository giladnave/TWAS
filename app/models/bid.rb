class Bid < ActiveRecord::Base
  belongs_to :user
  
  has_many :joinerships, :dependent => :destroy
  has_many :joiners, :through => :joinerships

  scope :expired, lambda { where('valid_until <= ?', Time.now) }
  scope :min_joiners, lambda { |i| where('join_num >= ?', i) }
end
