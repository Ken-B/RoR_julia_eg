# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ready page:load', ->

  poll = (div, callback) ->
    # Short timeout to avoid too many calls
    setTimeout ->
      $.get(div.data('status')).done (document) ->
        if document.calculated
          # Yay, it's calculated, we can update the content
          callback()
        else
          # Not finished yet, let's make another request...
          poll(div, callback)
    , 500

  $('[data-status]').each ->
    div = $(this)

    # Initiate the polling
    poll div, ->
      div.children('p').html('Number calculated successfully.')
      div.children('a').show()