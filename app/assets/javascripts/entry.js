Entry = {
  initEntryCategoryContent: function(){
    var count = 1;
    // $("#show_entry h2").each(function(){
    //     class_name = 'section ' + 'section_'+count
    //     $(this).addClass(class_name);
    //     // alert($('h2.class_name:gt(0):lt(1) h3,p,pre,img').text());
    //     // .wrapAll('<div></div>');
    //     count++;
    //     // alert($(this).html());
    // });
    $("h2").each(function(){
      class_name = 'section section_'+count 
      $(this).nextUntil("h2").andSelf().wrapAll("<div></div>"); 
      count++;
    }); 
    // $('h3,p,pre,img').wrapAll('<div></div>');
    // var categories = $("#show_entry h2").html();
    // count = categories.length;
    // for(i=0;i< count;i++){
    //   var one = categories[i];
    //   alert(one);
    // }
    // // alert(categories.length);

    // // alert(categories[0]);
  },

  textarea_previes_exchange:function(){
    preview_box = $(document.createElement("div")).attr("id", "preview");
    preview_box.addClass("body");
    $('textarea').after(preview_box);
    preview_box.hide();

    $("#edit_model").click(function(event){
      event.preventDefault();
      $('textarea').show()
      preview_box.hide()
      $('#preview_model').removeClass("active")
      $('#edit_model').addClass("active")
    });
    
    $("#preview_model").click(function(event){
      event.preventDefault();
      $('textarea').hide()
      preview_box.show()
      preview_box.text("Loading...")

      function get_contents(){
        return contents = {
          content: $('textarea').val()
        } 
      }
      $.post("/wiki/entry/preview",get_contents(),function(data){
        $("#preview").html(data.content)
      })

      $('#edit_model').removeClass("active")
      $('#preview_model').addClass("active")
    });
    
  }
}

$(function(){
  Entry.initEntryCategoryContent();
  Entry.textarea_previes_exchange();
});
