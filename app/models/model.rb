class Model < WindowFeature
  def possible_glass_types
    return GlassType.find(:all).find_all{|gt| (min_thickness..max_thickness).include?(gt.thickness)}
  end

  def is_giano?
    return "Giano"==name
  end
end
