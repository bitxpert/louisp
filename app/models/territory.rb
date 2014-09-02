class Territory < ActiveRecord::Base
belongs_to :region
belongs_to :division
end
