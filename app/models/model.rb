class Model < WindowFeature
  def possible_glass_types
    return GlassType.find(:all).find_all{|gt| (min_thickness..max_thickness).include?(gt.thickness)}
  end

  def is_giano?
    return "Giano"==name
  end

  def is_alu?
    return "Aluminium"==name
  end

  def is_pvc?
    return "PVC"==name
  end

  def no_calculations?
    return is_alu? || is_pvc?
  end
end
