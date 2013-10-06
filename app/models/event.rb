# -*- coding: utf-8 -*-
require 'smarter_csv'
class Event < ActiveRecord::Base
  attr_accessible :endtime, :place, :startime, :title

  def self.import(file)
  	result = SmarterCSV.process(file.path)
  	result.each do |rsl|
  		event = find_by_id(rsl[:id]) || new
  		event.attributes = rsl.to_hash
  		event.save
  	end
  end
end
