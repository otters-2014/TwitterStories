// drop down login from red-team-design
// http://red-team-design.com/simple-and-effective-dropdown-login-box/

$(document).ready(function(){

  var toggleForm = function(form_id){
    $(this).next(form_id).slideToggle();
    $(this).toggleClass('active');
    if ($(this).hasClass('active')) $(this).find('span').html('&#x25B2;')
      else $(this).find('span').html('&#x25BC;')
  }

  $('#login-trigger').click(function(e){
    var toggle = toggleForm.bind(this);
    var toggleOther = toggleForm.bind($('#signup-trigger'))
    e.preventDefault();
    toggle('#login-content');

    if ($( "#signup-trigger" ).hasClass("active")){
      toggleOther('#signup-content');
    }

  });

  $('#signup-trigger').click(function(e){

    var toggle = toggleForm.bind(this);
    var toggleOther = toggleForm.bind($('#login-trigger'))
    e.preventDefault();
    toggle('#signup-content');

    if ($( "#login-trigger" ).hasClass("active")){
      toggleOther('#login-content');
    }

  });

});
