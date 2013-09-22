class Soccer < ActiveRecord::Base
  attr_accessible :duration, :endtime, :group, :place, :round, :startime, :team_a, :team_b
end
