class WindowFeature < ActiveRecord::Base
  has_many  :dependencies_before, :foreign_key =>'feature_one_id', :class_name => 'Dependency'
  has_many  :dependencies_after, :foreign_key =>'feature_two_id', :class_name => 'Dependency'
  has_many  :before_features, :through => :dependencies_after
  has_many  :after_features, :through => :dependencies_before
  has_and_belongs_to_many :window_configs

  validates_presence_of :name
  validates_numericality_of :min_thickness, :max_thickness, :only_integer => true, :greater_than_or_equal_to => 0, :allow_nil => true
  validates_inclusion_of :type, :in => %w(Edge LayingKind Model PaintKind Typology Wood)

  def long_name
    return [:type].to_s+" :: "+name.to_s
  end

  def self.types
    %w(Model Wood Typology Edge PaintKind LayingKind)
  end

  def to_s
    "#{self[:type]} #{self.name}"
  end

  def from_my_type
     WindowFeature.find_all_by_type(type.to_s).collect { |c| [c.name ||= "No name found", c.id] }
  end

  def recommend(ids)
    configs = WindowConfig.templates
    configs = configs.find_all{|c| c.has_features?(ids)}

    return nil if configs==nil

    stat = {} # hash for statistics

    configs.each do |c|
    features = c.window_features.reject{|f| ids.include?(f.id.to_s)}
    features = features.find_all{|f| after_features.include?(f)}
    if features
      features.each do |f|
        stat[f] = 0 unless stat[f]
        stat[f] += 1
      end
    end
  end

  def self.search(search)
    if search
      find(:all, :conditions=>['name LIKE ? AND ( type LIKE ? OR type LIKE ? OR type LIKE ? )',"%#{search}%",'Wood','Model','Typology'])
    else
      find(:all, :conditions=>['type LIKE ? OR type LIKE ? OR type LIKE ?','Wood','Model','Typology'], :order => 'type')
    end

    stat = stat.sort{|a,b| b[1] <=> a[1]} # sort descending
    stat.collect!{|f| f[0]} # array of recommended features
    return stat.slice(0..2) # 3 most chosen
  end
end
