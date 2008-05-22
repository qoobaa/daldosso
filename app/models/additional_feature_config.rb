class AdditionalFeatureConfig < ActiveRecord::Base
  belongs_to :additional_feature,:class_name=>'AdditionalFeature',:foreign_key=>'additional_feature_id'
  belongs_to :window_config,:class_name=>'WindowConfig',:foreign_key=>'window_config_id'
end
