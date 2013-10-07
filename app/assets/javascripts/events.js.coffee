# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
	now = new Date().toLocaleString().replace(/(\.|:|\s)/g,'')
	# console.log "Zeit: " + now
	times = []

	$(".time").each (index) ->
		times.push parseFloat($(this).data("time"))
	
	# console.log  "alle Zeiten: " + times

	current_programm = (all_times) -> 
		current = all_times[0]
		smallest = Math.abs(current-now)
		for elem in all_times
			if (Math.abs(elem - now ) < smallest)	
				smallest = Math.abs(elem - now )
			# console.log "delta: " + delta
			# console.log "smallest: " + smallest
			delta = elem - now
			if delta < smallest
				current = elem

		# console.log "aktuelle Auswahl: " + current

		$('tr[data-time="0' + current + '"]').addClass "success bold"

	current_programm(times)