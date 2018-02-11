$(function() {
  $('.search').click(function(e) {
    e.preventDefault();

    var featureParams = {
      1: {
        min: 2,
        max: 3
      },
      2: {
        min: 5,
        max: 10
      },
      3: {
        min: 15,
        max: 35
      },
      4: {
        min: 6,
        max: 12
      }
    }

    $.ajax({
      method: 'GET',
      url: '/search?' + $.param(featureParams)
    }).done(function(response) {
      // render the images
      $('#results').append(response);
    });
  });
});
