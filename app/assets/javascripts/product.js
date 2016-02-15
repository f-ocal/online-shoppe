$(document).ready(function() {
  showCategoryListener();
});

var showCategoryListener = function(){
  if ($('.product-index').length > 0) {
    $('.dropdown-menu').on('click', 'a', function(event){
      event.preventDefault();

      var categoryLink = $(this).attr('href');
      var aReq = $.get(categoryLink);

      aReq.done(function(responseData){
        $('.product-list').html(responseData);
      })
    })
  }
};
