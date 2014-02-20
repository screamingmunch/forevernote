var resultz;

$(function(){
  var resultz;
  $('body').on('click', '#instagram', function(event){
    event.preventDefault();
    console.log('clicked instagram');
  $.get('/instagram.json').done(function(data) {

  // _.each(data, function(item) {

    // Create marker
    //var itemData = new google.maps.LatLng( parseFloat(item.latitude), parseFloat(item.longitude) )

    // Add pothole content
    // var potholeContent = JST['templates/pothole'](item);

    // Execute
    // createMarker(itemData, potholeContent, item.id);

    var image1 = data[0].images.standard_resolution.url;
    var image2 = data[1].images.standard_resolution.url;
    var image3 = data[2].images.standard_resolution.url;
    var image4 = data[3].images.standard_resolution.url;
    var image5 = data[4].images.standard_resolution.url;
    var image6 = data[5].images.standard_resolution.url;
    var image7 = data[6].images.standard_resolution.url;
    var image8 = data[7].images.standard_resolution.url;
    var image9 = data[8].images.standard_resolution.url;
    var image10 = data[9].images.standard_resolution.url;

    $('.instagram').append('<img src="'+ image1 + '" alt="image1" height="300px" width="auto">');
    $('.instagram').append('<img src="'+ image2 + '" alt="image1" height="300px" width="auto">');
    $('.instagram').append('<img src="'+ image3 + '" alt="image1" height="300px" width="auto">');
    $('.instagram').append('<img src="'+ image4 + '" alt="image1" height="300px" width="auto">');
    $('.instagram').append('<img src="'+ image5 + '" alt="image1" height="300px" width="auto">');
    $('.instagram').append('<img src="'+ image6 + '" alt="image1" height="300px" width="auto">');
    $('.instagram').append('<img src="'+ image7 + '" alt="image1" height="300px" width="auto">');
    $('.instagram').append('<img src="'+ image8 + '" alt="image1" height="300px" width="auto">');
    $('.instagram').append('<img src="'+ image9 + '" alt="image1" height="300px" width="auto">');
    $('.instagram').append('<img src="'+ image10 + '" alt="image1" height="300px" width="auto">');

  }).done(function(results) {
    $('.instagram').append('<br><br><button id="submitEvernote">Create a new Journal Page.</button>');
    resultz = results;

  })

  $('body').on('click', '#submitEvernote', function(event) {
    event.preventDefault();
    // console.log(resultz);
    $.post('/evernote_create_note', resultz).done(function(data){
      debugger
      console.log(data);
    });
    // $.ajax({
    //   type: "POST",
    //   url: ,
    //   data: {

    //   },
    //   success: success,

    // })

  })

  })

})
