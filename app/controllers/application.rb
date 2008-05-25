# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include AuthenticatedSystem

  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'c7a30b05f5571e48d0ddcb41fbd41d69'

  # Calculates cost from given features
  # features_ids - table of window feature's id
  def cost_calculation(features_ids)
    cost = 0
    for i in 0..features_ids.size-2
      id = features_ids[i]
      id_next = features_ids[i+1]
      feature_before = WindowFeature.find(id)
      feature_after = WindowFeature.find(id_next)
      dependency = feature_before.dependencies_before.detect{|db| db.after_feature==feature_after}
      cost+= dependency.meter_price!=nil ? dependency.meter_price : 0
    end
    return cost
  end
end
