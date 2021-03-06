$(function() {
  $('.search').click(function(e) {
    e.preventDefault();
    var sliders  = $('.sliderValue');
    var values = []
    $.each(sliders, function(sliderId, slider) {
      values.push(slider.value.split(' - '));
    });

    var featureParams = {
      1: {
        min: values[0][0],
        max: values[0][1]
      },
      2: {
        min: values[1][0],
        max: values[1][1]
      },
      3: {
        min: values[2][0],
        max: values[2][1]
      },
      4: {
        min: values[3][0],
        max: values[3][1]
      }
    }

    $.ajax({
      method: 'GET',
      url: '/search?' + $.param(featureParams)
    }).done(function(response) {
      var images = [];
      if (!$.isEmptyObject(response.images)) {
        $.each(response.images, function(imageId, imageData) {
          var url = imageData.url;
          var taxa = imageData.taxa;
          var tissue = imageData.tissue;
          var specimen = imageData.specimen;
          var measHtml = '';
          imageData.measurements.forEach(function(meas) {
            var desc = window.features[meas.feature_id];
            measHtml = measHtml + "<p>" + desc + ': ' + meas.metric + "</p>"
          });
          var html = "<div class='col-sm-4'> \
          <div class='image-unit'> \
          <img src=" + url + "> \
          <div class='metrics'> \
          <p>Taxa: " + taxa + "</p> \
          <p>Tissue: " + tissue + "</p> \
          <p>Specimen: " + specimen + "</p> \
          " + measHtml + " \
          </div></div>"
          images.push(html);
        });
        $('#results').html(images);
      } else {
        $('#results').html("<h2>No Match Found</h2>");
      }
    });
  });

  // $("#results").on( "click", ".image-unit", function() {
  //   $('.metrics').css("display", "none");
  //   $(this).find('.metrics').css("display", "block");
  // });
});
