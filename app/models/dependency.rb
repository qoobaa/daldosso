class Dependency < ActiveRecord::Base
	belongs_to :before_feature,:class_name=>'WindowFeature',:foreign_key => 'feature_one_id'
	belongs_to :after_feature,:class_name=>'WindowFeature',:foreign_key => 'feature_two_id'	
end
