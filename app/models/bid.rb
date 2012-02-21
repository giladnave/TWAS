class Bid < ActiveRecord::Base
  belongs_to :user
  
  has_many :joinerships, :dependent => :destroy
  has_many :joiners, :through => :joinerships

end
