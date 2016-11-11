$(document).ready(function() {
  clickLoginListener();
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
    $("#logo-container").append(response);
  });
  });
}
