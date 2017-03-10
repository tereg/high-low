$(document).ready(function() {
  clickLoginListener();
  clickRegisterListener();
});

var clickLoginListener = function() {
  $("#login").on("click", function(event){
    event.preventDefault();

    var loginButton = $(this);
    var action = loginButton.attr('href');

    var request = $.ajax({
      url: action,
    });

    request.done(function(response){
      $("#login-register").hide();
      $(".form-container").append(response);
    });
  });
}

var clickRegisterListener = function() {
  $("#register").on("click", function(event){
    event.preventDefault();

    var registerButton = $(this);
    var action = registerButton.attr('href');

    var request = $.ajax({
      url: action,
    });

    request.done(function(response){
      $("#login-register").hide();
      $(".front-page-text").append(response);
    });
  });
}

//For video background
$( document ).ready(function() {
  scaleVideoContainer();

  initBannerVideoSize('.video-container .poster img');
  initBannerVideoSize('.video-container .filter');
  initBannerVideoSize('.video-container video');

  $(window).on('resize', function() {
      scaleVideoContainer();
      scaleBannerVideoSize('.video-container .poster img');
      scaleBannerVideoSize('.video-container .filter');
      scaleBannerVideoSize('.video-container video');
  });
});

function scaleVideoContainer() {
  var height = $(window).height() + 5;
  var unitHeight = parseInt(height) + 'px';
  $('.homepage-hero-module').css('height',unitHeight);
}

function initBannerVideoSize(element){
  $(element).each(function(){
      $(this).data('height', $(this).height());
      $(this).data('width', $(this).width());
  });

  scaleBannerVideoSize(element);
}

function scaleBannerVideoSize(element){
  var windowWidth = $(window).width(),
  windowHeight = $(window).height() + 5,
  videoWidth,
  videoHeight;

  $(element).each(function(){
      var videoAspectRatio = $(this).data('height')/$(this).data('width');

      $(this).width(windowWidth);

      if(windowWidth < 1000){
          videoHeight = windowHeight;
          videoWidth = videoHeight / videoAspectRatio;
          $(this).css({'margin-top' : 0, 'margin-left' : -(videoWidth - windowWidth) / 2 + 'px'});

          $(this).width(videoWidth).height(videoHeight);
      }

      $('.homepage-hero-module .video-container video').addClass('fadeIn animated');
  });
}