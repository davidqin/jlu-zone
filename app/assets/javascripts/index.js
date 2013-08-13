function resize(){
  var h,w;
  if(!!(window.attachEvent&&!window.opera)){
    h = document.documentElement.clientHeight;
    w = document.documentElement.clientWidth;
  }else{
    h = window.innerHeight;
    w = window.innerWidth;
  }
  h = Math.max(625,h);
  var img = $('img');
  if((/msie/i.test(navigator.userAgent))){
    Acool.img.autoSize(img[0], w, h);
    img.css({"margin":0});
    $("#bg-images").css({"height": h});
  }else{
    img.hide();
    $("#bg-container").css({"background-image": "url(" + img[0].src + ")"});
    $("#bg-container").css({"height":h});
    setTimeout(function(){
      $("#bg-container").css({"opacity":1});
    },300);
  }
  $("#content").css("width", w);
  $("#container").css({width: w * 3, left: -w});
  $("#main").css({width:w});
  $("#login-page").css({width:w});
  $("#register-page").css({width:w});
  if(window.location.hash == "#login-page"){
    $("#container").css({left:0});
  }
}
jQuery(document).ready(function(){
  resize();
  $("#bg-info").hover(function(e){
    this.style.width = Acool.util.stringWidth(this).width + "px";
  }, function(e){
    this.style.width = "150px";
  });
  var width = parseInt($("#content").css("width"));

  $("#index").on( 'click', "#login", function(e){
    e.preventDefault();
    $("#container").css({transition: "all 0.5s ease-out", left: 0});
    setTimeout(function(){window.location.hash="#login-page"}, 500);
  });
  $("#index").on( 'click', "#register", function(e){
    e.preventDefault();
    $("#container").css({transition: "all 0.5s ease-out", left: -(2*width)});
    setTimeout(function(){window.location.hash="#register-page"}, 500);
  });

  $("#index").on( 'click', "[id$=-return]", function(e){
    e.preventDefault();
    $("#container").css({transition: "all 0.5s ease-out", left: -width});
    setTimeout(function(){window.location.hash=""}, 500);
  });
  window.onresize = resize;
});
