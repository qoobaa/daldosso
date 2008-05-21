class AdditionalFeature < ActiveRecord::Base
	has_many :additional_feature_configs,:class_name=>'AdditionalFeatureConfig',:foreign_key=>'additional_feature_id'
	has_many :window_configs, :through => :additional_feature_configs
end
