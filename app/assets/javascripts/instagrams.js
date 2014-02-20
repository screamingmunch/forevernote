$(function(){
  var resultz;
  var content;
  $('body').on('click', '#instagram', function(event){
    event.preventDefault();
    console.log('clicked instagram');
  $.get('/instagram.json').done(function(data) {


    $('.instagram').html("")
    var hashes = []

    $.each(data, function(index,val){

       var template_data ={image: val.images.standard_resolution.url}
       hashes.push(template_data)

    })

    $.each(hashes,function(index,val){
      content = JST['templates/instagram'](val);
      $('.instagram').append(content);
    })


  }).done(function(results) {
    $('.instagram').append('<br><br>');
    $('.instagram').append('<br><input>');
    $('.instagram').append('<br><button id="submitEvernote">Create a new Journal Page.</button>');
    resultz = results;

  })

  $('body').on('click', '#submitEvernote', function(event) {
    event.preventDefault();

    $.post('/evernote_create_note', resultz).done(function(data){
      data: { newnote: {
          title: 'New Test',
          notebookGuid: "93806f76-a906-40fd-a6f4-0678021b8b89",
          content: '<?xml version="1.0" encoding="UTF-8"?>' +
  '<!DOCTYPE en-note SYSTEM "http://xml.evernote.com/pub/enml2.dtd">' +
  '<en-note>'+'THIS IS a new test NOTE' +
  '</en-note>'
        }
      },

    });

  })

  })

})
