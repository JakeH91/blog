# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "turbolinks:load", ->
	# NEW POST
	# When clicking on one of the side icons
	$(".post-options .glyphicon").on "click", ->
	 	# If camera...
	 	if($(this).hasClass("glyphicon-camera"))
	 		# Set up Add Image function here later...
	 	else
	 		# Otherwise, reveal form field to enter details
	 		$(this).next().removeClass("hidden")
	 		$(this).addClass("hidden")

	# Reveal X (to remove field) when you hover over that form field
	$(".post-options .field").on "mouseenter", ->
		# Reveal the X (to remove field)
		$(this).find("span").removeClass("hidden")
	
	# Hide the X when the mouse leaves the form field
	$(".post-options .field").on "mouseleave", ->
		$(this).find("span").addClass("hidden")

	# If you click on the X, hide the form field and reveal the original icon
	$(".post-options .field .glyphicon").on "click", ->
		$(this).parent().prev().removeClass("hidden")
		$(this).parent().addClass("hidden")