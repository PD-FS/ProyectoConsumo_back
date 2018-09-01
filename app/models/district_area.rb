class DistrictArea < ApplicationRecord
	has_many :upzs, dependent: :destroy
end
