module Admin::WindowConfigsHelper
  def window_features_for_select(type, selected = nil)
    options_hash = {}
    WindowFeature.find_all_by_type(type).collect { |f| options_hash[f.name.to_s] = f.id }
    options_hash[""] = nil
    if selected
      options_for_select(options_hash, selected.id)
    else
      options_for_select(options_hash)
    end
  end
end
