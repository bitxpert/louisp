class Entertainment < ActiveRecord::Base
	belongs_to :user
	belongs_to :entertainment_parent_company, :foreign_key => :ee_user_id
	validates_presence_of :country, :name, :function
	validate :at_least_one_field

	def at_least_one_field
	  if [self.url, self.phone_number, self.street_address_1, self.email ].reject(&:blank?).size == 0
	    errors[:base] << ("Please choose at least one field (URl or Phone Number or Street Address 1 or email)")
	  end
	end     
end
