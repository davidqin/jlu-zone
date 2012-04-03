window.onload = function(){
  var $container = $('#pictures');  
  $container.imagesLoaded( function(){
    $container.masonry({
      itemSelector    : '.item',
    });
  }); 
}