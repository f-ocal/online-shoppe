// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function(){
  // updateCart();
  // deleteItemInTheCart();
})

var updateCart = function(){
  $('.edit_order_item').on('click', '.btn-primary' , function(event) {
    event.preventDefault();
    // console.log('Clicked Update');
    var newQuantity = $(this).serialize();
    $.ajax({
      url: '/order_items',
      method: 'POST',
      data: newQuantity
    })
    .done(function(responseData) {
      $(".quantity-in-cart").html(responseData);
    })
  })
}

var deleteItemInTheCart = function(){
  $('.edit_order_item').on('click', '.btn-danger' , function(event) {
    event.preventDefault();
    // console.log('Clicked Delete');
  })
}
