module Admin::DependenciesHelper

  def select_options_for_window_features
    WindowFeature.find(:all).collect { |wf| [wf.to_s, wf.id] }
  end

end
