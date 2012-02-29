 Dialog = {
  initTopBarLoginButton: function(){
    var login_url = $("#login_top_button").attr('login_url');
    $("#login_top_button").click(
      function(){
        $(this).colorbox({
          href: login_url
        });
      }
      );
  }
}

$(function(){
  Dialog.initTopBarLoginButton();
});
