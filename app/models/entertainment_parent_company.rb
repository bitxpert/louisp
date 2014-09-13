class EntertainmentParentCompany < ActiveRecord::Base
has_many :entertainments , :foreign_key => :ee_user_id
accepts_nested_attributes_for :entertainments
end
