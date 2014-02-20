$(function(){

  // alert('jquery')

    $( "#new_notebook" ).submit(function(event) {
      // alert( "Handler for .submit() called." );
      event.preventDefault();
      var title = {title: $('#notebook_name').val()}
       $.post("/evernote_create_notebook",title).done(function(data){
        // debugger
        // alert(data)
        var name = data.name

          $('#journal_list').append('<p>'+name+'</p>')
          $("#notebook_name").val("");

       })



     });






});