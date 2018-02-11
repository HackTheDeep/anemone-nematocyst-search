$(function() {
  $('.search').click(function(e) {
    e.preventDefault();

    var featureParams = [
      {
        id: 1,
        min: 3,
        max: 15
      },
      {
        id: 2,
        min: 5,
        max: 10
      },
        {
        id: 3,
        min: 15,
        max: 35
      },
        {
        id: 4,
        min: 6,
        max: 12
      }
    ]
    var params = { features: featureParams }

    $.ajax({
      method: 'GET',
      url: '/search?' + $.param(params);
    }).done(function(response) {
      // render the images
    });
  });
});
