# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
	now = new Date().toLocaleString().replace(/(\.|:|\s)/g,'')
	times = []

	$(".time").each (index) ->
		times.push parseInt($(this).data("time"))
	

	current_programm = (all_times) -> 
		current = all_times[0]
		for elem in all_times
			if elem < current
				current = elem
		# console.log current
		$('tr[data-time="' + current + '"]').addClass "success"

	current_programm(times)