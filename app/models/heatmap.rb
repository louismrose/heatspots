class Heatmap < ActiveRecord::Base
  has_many :heatspots, :dependent => :destroy
  accepts_nested_attributes_for :heatspots
end
