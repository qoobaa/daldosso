class WindowConfig < ActiveRecord::Base
  has_and_belongs_to_many :window_features
  has_many :additional_feature_notes
  has_many :additional_features, :through => :additional_feature_notes
  has_many :shutter_configs
  has_many :shutter_types, :through => :shutter_configs
  has_one :order_item, :as => :item
  belongs_to :customer, :class_name => 'User'
  belongs_to :glass_type
  belongs_to :glass_color
	belongs_to :sash_structure
	belongs_to :handle_type
  has_many :order_items, :as => :item

  validates_presence_of :customer, :glass_type, :glass_color, :sash_structure, :handle_type, :name
  validates_numericality_of :height, :width, :only_integer => true, :greater_than => 0

  def estimated_cost
    cost = 0
    for i in 0..window_features.size-2
      feature_before = window_features[i]
      feature_after = window_features[i+1]
      dependency = feature_before.dependencies_before.detect{|db| db.after_feature==feature_after}
      cost += dependency.cost(self)
    end
    return cost
  end

  def cost
    estimated_cost
  end

  def copy_constructor
    wc = self.clone
    self.window_features.each{|f| wc.window_features << f}
    return wc
  end

  def features_names
    "#{self.window_features.collect{|f| f.to_s}.join(', ')}"
  end

  def to_s
  "ID [#{self.id}] #{features_names} Height: #{height} Width: #{width}"
  end

  def window_size
    size = window_config.height * window_config.width * 1.0 # square cm
    size = size / 10000.0 # square m
    return size
  end

  def glass_size
    code = sash_structure.code # "F" or "PF"
    sashes = sash_structure.sashes_number # "sashes number"
    rail = height_medium_rail # if greater than zero then split window
    frame_sash_width = 1.0
    medium_rail_width = 1.0
    medium_rail_height = 1.0
    added_bottom_rail_width = 1.0
    central_stiles = 1.0
    h = height
    w = width
    min_area = 0,5 * 1000000

    case code
        when SashStructure.code_f
          case sashes
            when 0,1 # CODE F0,F1
              if rail > 0
                hg1 = medium_rail_height - frame_sash_width
                hg2 = h - ( medium_rail_width + frame_sash_width + medium_rail_height )
                wg12 = w - ( 2 * frame_sash_width )
                area1 = hg1 * wg12
                area2 = hg2 * wg12
                area1 = area1 > min_area ? area1 : min_area
                area2 = area2 > min_area ? area2 : min_area
                return area1 + area2
              else
                hg = h - ( 2 * frame_sash_width )
                wg = w - ( 2 * frame_sash_width )
                area = hg * wg
                area = area > min_area ? area : min_area
                return area
              end
            when 2 # CODE F2
              if rail > 0
                hg1 = medium_rail_height - frame_sash_width
                hg2 = h - ( medium_rail_width + frame_sash_width + medium_rail_height )
                wg12 = ( w - [ ( 2 * frame_sash_width ) + central_stiles ] ) / 2.0
                area1 = hg1 * wg12
                area2 = hg2 * wg12
                area1 = area1 > min_area ? area1 : min_area
                area2 = area2 > min_area ? area2 : min_area
                return (area1 + area2) * 2
              else
                hg12 = h - ( 2 * frame_sash_width )
                wg12 = ( w - [ ( 2 * frame_sash_width ) + central_stiles ] ) / 2.0
                area = hg12 * wg12
                area = area > min_area ? area : min_area
                return area * 2
              end
            when 3 # CODE F3
              if rail > 0
                hg1 = medium_rail_height - frame_sash_width
                hg2 = h - ( medium_rail_width + frame_sash_width + medium_rail_height )
                wg123 = ( w - [ ( 2 * frame_sash_width ) + ( 2 * central_stiles ) ] ) / 3.0
                area1 = hg1 * wg123
                area2 = hg2 * wg123
                area1 = area1 > min_area ? area1 : min_area
                area2 = area2 > min_area ? area2 : min_area
                return (area1+area2) * 3
              else
                hg123 = h - ( 2 * frame_sash_width )
                wg123 = ( w - [ ( 2 * frame_sash_width ) + ( 2 * central_stiles ) ] ) / 3.0
                area = hg123 * wg123
                area = area > min_area ? area : min_area
                return area * 3
              end
            when 4 # CODE F4
              if rail > 0
                hg1 = medium_rail_height - frame_sash_width
                hg2 = h - ( medium_rail_width + frame_sash_width + medium_rail_height )
                wg1234 = ( w - ( ( 2 * frame_sash_width ) + ( 3 * central_stiles ) ) ) / 4.0
                area1 = hg1 * wg1234
                area2 = hg2 * wg1234
                area1 = area1 > min_area ? area1 : min_area
                area2 = area2 > min_area ? area2 : min_area
                return (area1+area2) * 4
              else
                hg1234 = h - ( 2 * frame_sash_width )
                wg1234 = (w - ( ( 2 * frame_sash_width ) + ( 3 * central_stiles ) ) ) / 4.0
                area = hg1234 * wg1234
                area = area > min_area ? area : min_area
                return area * 4
              end
          end
        when SashStructure.code_pf
          case sashes
            when 0,1 # CODE PF1
              if rail > 0
                hg1 = medium_rail_height - frame_sash_width - added_bottom_rail_width
                hg2 = h - ( medium_rail_width + frame_sash_width + medium_rail_height )
                wg12 = w - ( 2 * frame_sash_width )
                area1 = hg1 * wg12
                area2 = hg2 * wg12
                area1 = area1 > min_area ? area1 : min_area
                area2 = area2 > min_area ? area2 : min_area
                return area1 + area2
              else
                hg = h - ( ( 2 * frame_sash_width ) - added_bottom_rail_width )
                wg = w - ( 2 * frame_sash_width )
                area = hg * wg
                area = area > min_area ? area : min_area
                return area
              end
            when 2 # CODE PF2
              if rail > 0
                hg1 = medium_rail_height - frame_sash_width - added_bottom_rail_width
                hg2 = h - ( medium_rail_width + frame_sash_width + medium_rail_height )
                wg12 = ( w - ( ( 2 * frame_sash_width ) + central_stiles )) / 2.0
                area1 = hg1 * wg12
                area2 = hg2 * wg12
                area1 = area1 > min_area ? area1 : min_area
                area2 = area2 > min_area ? area2 : min_area
                return (area1+area2) * 2
              else
                hg12 = h - (( 2 * frame_sash_width ) - added_bottom_rail_width )
                wg12 = ( w - (( 2 * frame_sash_width ) + central_stiles ) ) / 2.0
                area = hg12 * wg12
                area = area > min_area ? area : min_area
                return area * 2
              end
            when 3 # CODE PF3
              if rail > 0
                hg1 = medium_rail_height - frame_sash_width - added_bottom_rail_width
                hg2 = h - ( medium_rail_width + frame_sash_width + medium_rail_height )
                wg123 = ( w - ( ( 2 * frame_sash_width ) + ( 2 * central_stiles ) )) / 3.0
                area1 = hg1 * wg123
                area2 = hg2 * wg123
                area1 = area1 > min_area ? area1 : min_area
                area2 = area2 > min_area ? area2 : min_area
                return (area1 + area2) * 3
              else
                hg123 = h - ( ( 2 * frame_sash_width ) - added_bottom_rail_width )
                wg123 = ( w - ( ( 2 * frame_sash_width ) + ( 2 * central_stiles ) )) / 3.0
                area = hg123 * wg123
                area = area > min_area ? area : min_area
                return area * 3
              end
            when 4 # CODE PF4
              if rail > 0
                hg1 = medium_rail_height - frame_sash_width - added_bottom_rail_width
                hg2 = h - ( medium_rail_width + frame_sash_width + medium_rail_height )
                wg1234 = ( w - (( 2 * frame_sash_width ) + ( 3 * central_stiles ) )) / 4.0
                area1 = hg1 * wg1234
                area2 = hg2 * wg1234
                area1 = area1 > min_area ? area1 : min_area
                area2 = area2 > min_area ? area2 : min_area
                return (area1 + area2) * 4
               else
                hg1234 = h - ( ( 2 * frame_sash_width ) - added_bottom_rail_width)
                wg1234 = ( w - ( ( 2 * frame_sash_width ) + ( 3 * central_stiles ) )) / 4.0
                area = hg1234 * wg1234
                area = area > min_area ? area : min_area
                return area * 4
              end
          end
      end
  end

end
