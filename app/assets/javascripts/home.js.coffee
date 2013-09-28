# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $('#login_btn').click ->
    $('.login').show()
    $('.sign_up').hide()
    $('.password_reset').hide()
  $('#join_btn').click ->
    $('.login').hide()
    $('.sign_up').show()
    $('.password_reset').hide()
  $('.show-sign-up').click ->
    $('.login').hide()
    $('.sign_up').show()
    $('.password_reset').hide()
  $('.show-login').click ->
    $('.login').show()
    $('.sign_up').hide()
    $('.password_reset').hide()
  $('.show-forgot-password').click ->
    $('.login').hide()
    $('.sign_up').hide()
    $('.password_reset').show()
  
  
    