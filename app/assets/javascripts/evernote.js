$(function(){

  // alert('jquery')

    $( "#new_notebook" ).submit(function(event) {
      // alert( "Handler for .submit() called." );
      event.preventDefault();
      var title = {title: $('#notebook_name').val()}
       $.post("/evernote_create_notebook",title).done(function(data){
        // alert(data)
          $("#notebook_name").val("");

       })



       });






});