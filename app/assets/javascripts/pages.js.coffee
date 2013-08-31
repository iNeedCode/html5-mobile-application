# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

# c for celsius, f for fahrenheit
$ ->
	DEG = 'c'

	weatherDiv = $('#weather')
	scroller = $('#scroller')
	location = $('p.location')


	locationSuccess = (position) ->
		try
			cache = localStorage.weatherCache and JSON.parse(localStorage.weatherCache)
			d = new Date();

			if cache and cache.timestamp and cache.timestamp > d.getTime() - 30 * 60 * 1000

				offset = d.getTimezoneOffset() * 60 * 1000
				city = cache.data.city.name
				country = cache.data.city.country
				$.each cache.data.list, ->
					localTime = new Date(@dt * 1000 - offset)
					addWeather @weather[0].icon, moment(localTime).calendar(), @weather[0].description + " <b>" + @main.temp_min + "°" + DEG + " / " + @main.temp_max + "°" + DEG + "</b>"
				location.html city
			else
				weatherAPI = 'http://api.openweathermap.org/data/2.5/forecast?id=2847602&callback=?&units=metric&lang=de&APPID=e63c706730038c42aa955ed5551dc9d2'
				$.getJSON weatherAPI, (response) ->
  
					  # Store the cache
					  localStorage.weatherCache = JSON.stringify(
					    timestamp: (new Date()).getTime() # getTime() returns milliseconds
					    data: response
					  )
					  
					  # Call the function again
					  locationSuccess position
	
		catch e
			showError "We can't find information about your city!"
			window.console and console.error(e)

	addWeather = (icon, day, condition) ->
		#console.log "<li>" + "<img src=\"assets/icons/" + icon + ".png\" />" + " <p class=\"day\">" + day + "</p> <p class=\"cond\">" + condition + "</p></li>"
		markup = "<li>" + "<img src=\"assets/icons/" + icon + ".png\" />" + " <p class=\"day\">" + day + "</p> <p class=\"cond\">" + condition + "</p></li>"
		scroller.append markup

	convertTemperature = (kelvin) ->
		# Convert the temperature to either Celsius or Fahrenheit:
		Math.round (if DEG is "c" then (kelvin - 273.15) else (kelvin * 9 / 5 - 459.67))
	
	showError = (msg) ->
		weatherDiv.addClass("error").html msg

	# Error handling functions 
	locationError = (error) ->
		switch error.code
			when error.TIMEOUT
				showError "A timeout occured! Please try again!"
			when error.POSITION_UNAVAILABLE
				showError "We can't detect your location. Sorry!"
			when error.PERMISSION_DENIED
				showError "Please allow geolocation access for this to work."
			when error.UNKNOWN_ERROR
				showError "An unknown error occured!"

	# listen for arrow keys
	showSlide = (i) ->
		items = scroller.find("li")
		return false  if i >= items.length or i < 0 or scroller.is(":animated")
		weatherDiv.removeClass "first last"
		if i is 0
			weatherDiv.addClass "first"
		else weatherDiv.addClass "last"  if i is items.length - 1
		scroller.animate
			left: (-i * 100) + "%"
		, ->
			currentSlide = i


	$(document).keydown (e) ->
		switch e.keyCode
			when 37
				weatherDiv.find("a.previous").click()
			when 39
				weatherDiv.find("a.next").click()


	# Handling the previous / next arrows 
	currentSlide = 0
	weatherDiv.find("a.previous").click (e) ->
		e.preventDefault()
		showSlide currentSlide - 1

	weatherDiv.find("a.next").click (e) ->
		e.preventDefault()
		showSlide currentSlide + 1


	locationSuccess()
    
  #     # Retrive the cache
  #     cache = localStorage.weatherCache and JSON.parse(localStorage.weatherCache)
  #     d = new Date()
      
  #     # If the cache is newer than 30 minutes, use the cache
  #     if cache and cache.timestamp and cache.timestamp > d.getTime() - 30 * 60 * 1000
        
  #       # Get the offset from UTC (turn the offset minutes into ms)
  #       offset = d.getTimezoneOffset() * 60 * 1000
  #       city = cache.data.city.name
  #       country = cache.data.city.country
  #       $.each cache.data.list, ->
          
  #         # "this" holds a forecast object
          
  #         # Get the local time of this forecast (the api returns it in utc)
  #         localTime = new Date(@dt * 1000 - offset)
  #         # We are using the moment.js library to format the date
  #         addWeather @weather[0].icon, moment(localTime).calendar(), @weather[0].main + " <b>" + convertTemperature(@main.temp_min) + "°" + DEG + " / " + convertTemperature(@main.temp_max) + "°" + DEG + "</b>"
  
        
  #       # Add the location to the page
  #       location.html city + ", <b>" + country + "</b>"
  #       weatherDiv.addClass "loaded"
        
  #       # Set the slider to the first slide
  #       showSlide 0
  #     else
        
  #       # If the cache is old or nonexistent, issue a new AJAX request
  #       weatherAPI = "http://api.openweathermap.org/data/2.5/forecast?id=2847602&callback=?&units=metric&lang=de&APPID=e63c706730038c42aa955ed5551dc9d2"
  #       $.getJSON weatherAPI, (response) ->
          
  #         # Store the cache
  #         localStorage.weatherCache = JSON.stringify(
  #           timestamp: (new Date()).getTime() # getTime() returns milliseconds
  #           data: response
  #         )
          
  #         # Call the function again
  #         locationSuccess position

  #      catch e
  #        showError "We can't find information about your city!"
  #        window.console and console.error(e)
     
	 # $.getJSON weatherAPI, (response) ->
	 #   console.log response
	 #   $("#weather-city").text(response.city.name)
