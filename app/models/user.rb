class User < ActiveRecord::Base
  
  has_many :bids, :dependent => :destroy

  has_many :joinerships, 
    :foreign_key => :joiner_id

  has_many :joined, 
    :through => :joinerships,
    :source => :bid

  has_many :reverse_joinerships, 
    :through => :bids, 
    :class_name => "Joinership", 
    :source => :joinerships

  has_many :participants, 
    :through => :reverse_joinerships,
    :source => :joiner,
    :class_name => 'User'
  
  accepts_nested_attributes_for :bids
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :bids
end
