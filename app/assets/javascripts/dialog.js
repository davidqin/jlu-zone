 Dialog = {
  initTopBarLoginButton: function(){
    var login_url = $("#login_top_button").attr('login_url');
    $("#login_top_button").click(
      function(){
        $(this).colorbox({
          href: login_url,
          onComplete: function(){
            Dialog.initialLoginButton();
          }
        })
      }
      );
  },
  onSaveComplete: function(){
    if ($('.alert').size() ==0){
      $.colorbox.close();

    }else{
      Dialog.initialLoginButton();
    }

  },
  initialLoginButton: function(){
    $('#login_button').click(function(){
      var params = $('#login_button').parent().serializeArray();
      var url = $('#login_button').attr('url');
      $.colorbox({
        href: url,
        data: params,
        onComplete: function(){
          Dialog.onSaveComplete();
        }
      })
    });
  }
}

$(function(){
  Dialog.initTopBarLoginButton();
});
