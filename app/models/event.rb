class Event < ActiveRecord::Base
  attr_accessible :endtime, :place, :startime, :title
end
