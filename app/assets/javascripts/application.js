// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .
Application = {
  initBackToTopButton: function(){
    //首先将#back-to-top隐藏
    $("#back-to-top").hide();
    //当滚动条的位置处于距顶部100像素以下时，跳转链接出现，否则消失
    $(function(){
      $(window).scroll(function(){
        if ($(window).scrollTop()>100){
          $("#back-to-top").fadeIn(1500);
        }
        else
        {
          $("#back-to-top").fadeOut(1500);
        }
      });
      //当点击跳转链接后，回到页面顶部位置
      $("#back-to-top").click(function(){
        $('body,html').animate({scrollTop:0},1000);
        return false;
      });
    });
  }
}

$(function(){
  Application.initBackToTopButton();
  Application.initcategorydropmenu();
});
