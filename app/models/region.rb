class Region < ActiveRecord::Base
has_many :users
has_many :territories
end
