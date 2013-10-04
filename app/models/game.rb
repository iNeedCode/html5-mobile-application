class Game < ActiveRecord::Base
  attr_accessible :description, :title

  def self.find_by_id_or_title(param)
  		if param.to_i == 0
  			return Game.find_by_title(param) unless param.is_a? Integer
  		end
  		Game.find(param)
  end
end
