$(function() {
  $('.search').click(function(e) {
    e.preventDefault();

    var featureParams = {
      1: {
        min: 2,
        max: 100
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
      var images = [];
      $.each(response, function(key, value) {
        console.log(value);
        var html = "<div class='col-sm-4 image-unit'> \
        <img src=" + value['image_url'] + "></div> \
        <div>Metric:" + value['metric'] + "</div>"
        images.push(html);
      });
      $('#results').html(images);
    });
  });
});
