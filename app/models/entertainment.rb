class Entertainment < ActiveRecord::Base
belongs_to :user
validates_presence_of :name, :country, :phone_number, :url, :state_or_province
end
