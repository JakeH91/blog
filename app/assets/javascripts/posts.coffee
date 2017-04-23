# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
	$(".post-options .glyphicon").on "click", ->
	 	if($(this).hasClass("glyphicon-camera"))

	 	else
	 		$(this).next().removeClass("hidden")
	 		$(this).addClass("hidden")

	$(".post-options .field").on "mouseenter", ->
		$(this).find("span").removeClass("hidden")
	 	
	$(".post-options .field").on "mouseleave", ->
		$(this).find("span").addClass("hidden")

	$(".post-options .field .glyphicon").on "click", ->
		$(this).parent().prev().removeClass("hidden")
		$(this).parent().addClass("hidden")