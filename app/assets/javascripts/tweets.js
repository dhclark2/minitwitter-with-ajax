$(document).on('turbolinks:load', function() {
  $('.searchable-button').click(function(event) {
    var search = $('.searchable-tweets').val()
    $.ajax({
      method: 'POST',
      url: '/',
      data: { search: search},
      dataType: 'script'
    });

// Search box saves text input as "search" variable.  Ajax should then search the tweet index (/),
// and the tweet_controller should output an index where the search variable is equal to the tweet.


// $.ajax({
//   url: url,
//   dataType: "script",
//   success: success
// });
  })
})

// $.ajax({
// We need to declare the type of HTTP request we’d like to make.
//   method: 'POST',
// This tells our request where our endpoint is located.
//   url: 'http://some.receiving.site/route',
// Our data should be a Javascript object.
// It will be sent as the “body” for POST or PUT requests
// and converted to a query string for GET requsts.
//   data: { info: 'My data to send' }
// });
