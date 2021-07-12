// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {
  $("body").on( "click",".add-item-btn", function() {
    // set hidden field value to send via form
    var item_id = $( this ).data("id")
    var item_hidden_field = $( this ).next()
    item_hidden_field.val(item_id)

    // decorate text, disable button after click
    $( this ).text('Added')
    $( this ).addClass('disabled')

    // decorate buy button with selected count
    modifyBuyBtn()

    return true
  });
  
  $("body").on( "click","#buy-btn", function() {
    var form = $('form#order_form')
    $.ajax({
      url: form.attr('action'),
      type: 'post',
      dataType: 'json',
      data: form.serialize(),
      success: function(data) {
        // console.log('response data ---', data)
      }
    });
  });

  // modify selected item count and btn text
  function modifyBuyBtn() {
    $( '#buy-btn' ).data('count', selCount() + 1)
    $( '#buy-btn' ).text('Buy ' + selCount() + ' items')
  }

  // get selected item count
  function selCount() {
    return $( '#buy-btn' ).data('count')
  }
});
