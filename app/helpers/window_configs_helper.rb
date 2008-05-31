module WindowConfigsHelper
  def select_options_for_glass_types(id)
    model = Model.find(id)
    gt = model.possible_glass_types
    gt.collect { |c| [c.name ||= "No name found", c.id] }
  end

end
