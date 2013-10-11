# -*- coding: utf-8 -*-
require 'smarter_csv'
class Cricket < ActiveRecord::Base
  attr_accessible :duration, :game_id, :endtime, :group, :place, :result_a, :result_b, :round, :startime, :team_a, :team_b

  def self.import(file)
  	result = SmarterCSV.process(file.path)
  	result.each do |rsl|
  		item = find_by_id(rsl[:id]) || new
  		item.attributes = rsl.to_hash
  		item.endtime = item.startime+item.duration*60
  		item.save
  	end
  end
    
end
