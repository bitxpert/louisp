class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_one :painting
  has_one :funny_image
  belongs_to :region, foreign_key: "region_id"
  belongs_to :division
  has_many :entertainments
  belongs_to :role
  validates_uniqueness_of :user_main_id
  validates_presence_of :role_id, :division_id, :region_id
  #validates_numericality_of :age, :only_integer =>true, 
  #                        :greater_than_or_equal_to =>0, 
  #                        :message => "invalid"
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def active_for_authentication? 
    super && approved? 
  end 

  def inactive_message 
    if !approved? 
      :not_approved 
    else 
      super # Use whatever other message 
    end 
  end

end
