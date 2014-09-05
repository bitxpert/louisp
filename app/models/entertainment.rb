class Entertainment < ActiveRecord::Base
belongs_to :user
validates_presence_of :country, :url
end
