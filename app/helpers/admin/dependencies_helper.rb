module Admin::DependenciesHelper

  def select_options_for_window_features
    WindowFeature.find(:all).collect { |wf| ["#{wf.type} #{wf.name}", wf.id] }
  end

end
