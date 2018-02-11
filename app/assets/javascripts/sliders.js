$( function() {
  $( ".slider-range" ).slider({
    range: true,
    min: 0,
    max: 200,
    values: [ 1, 200 ],
    slide: function( event, ui ) {
      console.log(event.target.id);
      var slider = event.target.id;
      for (var i = 0; i < ui.values.length; ++i) {
        $("input.sliderValue[data-index=" + slider + "]").val(ui.values[0] + " - " + ui.values[1]);
      }
    }
  });
  // $( "#amount" ).val( "$" + $( "#slider-range" ).slider( "values", 0 ) +
  //   " - $" + $( "#slider-range" ).slider( "values", 1 ) );
});






