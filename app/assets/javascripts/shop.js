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
  
  // when user clicks on the buy btn send the order info, calculate the total
  // and show the information to the user to pay
  $("body").on( "click","#buy-btn", function() {
    var form = $('form#order_form')
    $.ajax({
      url: form.attr('action'),
      type: 'post',
      dataType: 'json',
      data: form.serialize(),
      success: function(data) {
        showConfirm(data['total'])
        setupPayLink(data)
      }
    });
  });

  // Reload the page to select the items again
  $("body").on( "click","#select-again-btn", function() {
    location.reload();
  });

  // hide buy btn and show the confim btn and info
  function showConfirm(total) {
    $( '#buy-btn' ).hide()
    $( '.total-info' ).removeClass('d-none')
    var total_txt = $( '.total-text' ).text()
    $( '.total-text' ).text( total_txt + total)

    // if the total is $0 disable pay btn
    if (total == 0) { disablePayBtn() }
  }

  // make the pay btn clickable to do the payment 
  function setupPayLink(response) {
    $("body").on( "click","#pay-btn", function() {
      $.ajax({
        url: response['complete_link'],
        type: 'put',
        dataType: 'json',
        data: {
          order_id: response['order_id'],
          authenticity_token: $('meta[name="csrf-token"]').attr('content')
        },
        success: function(data) {
          paymentCompleted()
        },
        error: function() {
          showError()
        }
      });
    });
  }

  // hide pay related btns and show the message payment made
  function paymentCompleted() {
    $( '#pay-btn' ).hide()
    $( '.total-text' ).text( 'Payment successful!' )
    $( '#select-again-btn' ).text( 'Shop again' )
  }

  function showError() {
    $( '.total-text' ).text( 'Oops...Something went wrong!' )
    disablePayBtn()
  }

  // modify selected item count and btn text
  function modifyBuyBtn() {
    $( '#buy-btn' ).data('count', selCount() + 1)
    $( '#buy-btn' ).text('Buy ' + selCount() + ' items')
  }

  function disablePayBtn() { $( '#pay-btn' ).addClass('disabled') }

  // get selected item count
  function selCount() {
    return $( '#buy-btn' ).data('count')
  }
});
