class EntertainmentParentCompany < ActiveRecord::Base
has_many :entertainments , :foreign_key => :ee_user_id
end
