class Entertainment < ActiveRecord::Base
	belongs_to :user
	validates_presence_of :country
	validate :at_least_one_field

	def at_least_one_field
	  if [self.url, self.phone_number, self.street_address_1].reject(&:blank?).size == 0
	    errors[:base] << ("Please choose at least one field (URl or Phone Number or Street Address 1)")
	  end
	end     
end
