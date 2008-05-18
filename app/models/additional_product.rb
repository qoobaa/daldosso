class AdditionalProduct < ActiveRecord::Base
	belongs_to :additional_group
	has_many :additional_configs
end
