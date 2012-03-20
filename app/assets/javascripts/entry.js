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

  textarea_previes_exchange:function(){
    preview_box = $(document.createElement("div")).attr("id", "preview");
    preview_box.addClass("body");
    $('textarea').after(preview_box);
    preview_box.hide();

    $("#edit_model").click(function(event){
      event.preventDefault();
      $('.markItUpContainer').show()
      preview_box.hide()
      $('#preview_model').removeClass("active")
      $('#edit_model').addClass("active")
    });
    
    $("#preview_model").click(function(event){
      event.preventDefault();
      $('.markItUpContainer').hide()
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
