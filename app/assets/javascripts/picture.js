$(document).ready(function(){
  var $container = $('#photos');  
  $container.imagesLoaded( function(){
    $container.masonry({
      itemSelector    : '.item',
    });
  }); 
})