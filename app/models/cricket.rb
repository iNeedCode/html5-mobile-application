class Cricket < ActiveRecord::Base
  attr_accessible :duration, :endtime, :group, :place, :result_a, :result_b, :round, :startime, :team_a, :team_b
end
