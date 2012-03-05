 Dialog = {
  initTopBarLoginButton: function(){
    var login_url = $("#login_top_button").attr('login_url');
    $("#login_top_button").click(
      function(){
        $(this).colorbox({
          inline: true,
          href: "#login_dialog_hided"
        });
      }
      );
  }
}

$(function(){
  Dialog.initTopBarLoginButton();
});
