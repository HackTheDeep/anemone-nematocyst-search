/* Slider contructor with  min and max sliders  */

// $(document).ready(function() {
//   $("#slider").slider({
//     min: 0,
//     max: 100,
//     step: 1,
//     values: [10, 90],
//     slide: function(event, ui) {
//       for (var i = 0; i < ui.values.length; ++i) {
//         $("input.sliderValue[data-index=" + i + "]").val(ui.values[i]);
//       }
//     }
//   });

//   $("input.sliderValue").change(function() {
//     var $this = $(this);
//     $("#slider").slider("values", $this.data("index"), $this.val());
//   });
// });


$( function() {
  $( ".slider-range" ).slider({
    range: true,
    min: 0,
    max: 200,
    values: [ 30, 100 ],
    slide: function( event, ui ) {
      console.log(event);
      // $( "#amount" ).val( "$" + ui.values[ 0 ] + " - $" + ui.values[ 1 ] );
    }
  });
  // $( "#amount" ).val( "$" + $( "#slider-range" ).slider( "values", 0 ) +
    // " - $" + $( "#slider-range" ).slider( "values", 1 ) );
} );
