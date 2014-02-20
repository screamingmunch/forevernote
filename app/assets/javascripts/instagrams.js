var resultz;

$(function(){
  var resultz;
  $('body').on('click', '#instagram', function(event){
    event.preventDefault();
    console.log('clicked instagram');
  $.get('/instagram.json').done(function(data) {


    $('.instagram').html("")
    $.each(data, function(index,val){

      var image = val.images.standard_resolution.url
      $('.instagram').append('<img src="'+ image + '" height="300px" width="auto">');
    })

  }).done(function(results) {
    $('.instagram').append('<br><br><button id="submitEvernote">Create a new Journal Page.</button>');
    resultz = results;

  })

  $('body').on('click', '#submitEvernote', function(event) {
    event.preventDefault();

    $.post('/evernote_create_note', resultz, function(data){
      console.log(data);
    });

  })

  })

})