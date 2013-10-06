# -*- coding: utf-8 -*-
require 'smarter_csv'
class Soccer < ActiveRecord::Base
  attr_accessible :duration, :endtime, :group, :place, :round, :startime, :team_a, :team_b, :result_a, :result_b

  def self.import(file)
  	result = SmarterCSV.process(file.path)
  	result.each do |rsl|
  		soccer = find_by_id(rsl[:id]) || new
  		soccer.attributes = rsl.to_hash
  		soccer.endtime = soccer.startime+soccer.duration*60
  		soccer.save
  	end
  end

end
