# -*- coding: utf-8 -*-

class ApplicationController < ActionController::Base
	protect_from_forgery
	helper_method :all_regions, :soccer_rounds, :available_places, :available_groups


	def all_regions
		all_regions = ["Muqami", "Nord", "Nord-Ost", "Nord-West", "Süd", "Süd-Ost", "Süd-West", "West", "Mitte", "Ost"]
	end

	def soccer_rounds
		soccer_rounds = ["Vorrunde", "Achtelfinale", "Viertelfinale", "Halbfinale", "Spiel um Platz 3", "Finale"]
	end

	def available_places
		available_places = ["Fußball A", "Fußball B", "Cricket A", "Cricket B", "Cricket C", "Basketball A"]
	end

	def available_groups
		groups = "A".."G"
		groups.to_a
	end

  def default_url_options
    if Rails.env.production?
      {:host => "37.221.168.115:8080"}
      
    else  
      {}
    end
  end

end
