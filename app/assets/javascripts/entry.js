Entry = {
  initEntryCategoryContent: function(){
    var count = 1;
    $("#show_entry h2").each(function(){
        class_name = 'section ' + 'section_'+count
        $(this).addClass(class_name)
        alert($("#show_entry h2:gt(0):lt(2) *").text());
        count++;

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
