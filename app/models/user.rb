class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_one :painting
  has_many :entertainments
  validates_numericality_of :age, :only_integer =>true, 
                          :greater_than_or_equal_to =>0, 
                          :message => "invalid"
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
