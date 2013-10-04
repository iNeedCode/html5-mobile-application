# -*- coding: utf-8 -*-
class Competition < ActiveRecord::Base
  attr_accessible :description, :title

  def self.find_by_id_or_title(param)
  		if param.to_i == 0
  			return Competition.find_by_title(param) unless param.is_a? Integer
  		end
  		Competition.find(param)
  end  
end
