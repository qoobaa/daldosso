module Admin::WindowConfigsHelper
  def window_features_for_select(type, selected = nil)
    options_for_select([""] + WindowFeature.find_all_by_type(type), selected)
  end
end
