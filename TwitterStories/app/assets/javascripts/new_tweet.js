$(document).ready(function() {
  console.log($('#new_tweet'));
  $('#new_tweet').on('submit', function(e){
    e.preventDefault();
    var input = { tweet: {text: $('#tweet_text').val() }}
  console.log(input);
    $.ajax({
      type: 'post',
      url: '/tweets',
      data: input,
      success: function(result) {
        $('p').clear;
        $('p').text("You tweeted: " + result.text);
      }
    });

  });
});
