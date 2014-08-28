# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('#entertainments').dataTable({
    sPaginationType: "full_numbers"
    bJQueryUI: true
    bProcessing: true
    bServerSide: true
    sAjaxSource: $('#entertainments').data('source')
    }).makeEditable({
        sUpdateURL: "/entertainments/:id",
        "aoColumns": [
                        null,
                        {		
                        		placeholder: ''
                        },
                        {
                                placeholder: ''
                        },
                        {
                                placeholder: ''
                        },
                        {
                                placeholder: ''
                        }
                ]
    });