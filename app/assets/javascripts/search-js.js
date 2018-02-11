$(function() {
  $('.search').click(function(e) {
    e.preventDefault();

    var featureParams = {
      1: {
        min: 2,
        max: 100
      },
      2: {
        min: 1,
        max: 100
      },
      3: {
        min: 15,
        max: 350
      },
      4: {
        min: 6,
        max: 120
      }
    }

    $.ajax({
      method: 'GET',
      url: '/search?' + $.param(featureParams)
    }).done(function(response) {
      var images = [];
      console.log("Searched and got:", response.images)
      if (!$.isEmptyObject(response.images)) {
        $.each(response.images, function(imageId, imageData) {
          var url = imageData.url;
          var meas = imageData.measurements;

          var html = "<div class='col-sm-4 image-unit'> \
          <img src=" + url + "></div> \
          <div>Metrics:" + JSON.stringify(meas) + "</div>"
          images.push(html);
        });
      }
      $('#results').html(images);
    });
  });
});
