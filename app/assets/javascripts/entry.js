Entry = {
  initEntryCategoryContent: function(){
    $("#show_entry h2").each(function(){
        // alert($(this).html());
    });
    // var categories = $("#show_entry h2").html();
    // count = categories.length;
    // for(i=0;i< count;i++){
    //   var one = categories[i];
    //   alert(one);
    // }
    // // alert(categories.length);

    // // alert(categories[0]);
  }
}

$(function(){
  Entry.initEntryCategoryContent();
});
