Entry = {
  initEntryCategoryContent: function(){
    if ($("#show_entry").attr('catalog')=="true"){
      var navLabels = new Array;
      $("#show_entry h2").each(function(){
        navLabels.push($(this).text());
        $(this).nextUntil("h2").andSelf().wrapAll("<div class=\"section\"></div>");
      });
      $('#show_entry').pageScroller({ navigation: navLabels,scrollOffset: 50 });
    }
  },  
}

$(function(){
  Entry.initEntryCategoryContent();  
});
