$(function(){
  $("#new_author").submit(function(event){
    event.preventDefault();
    debugger;
    var action= $(this).attr('action');
    var method= $(this).attr('method');
    var data = $(this).serializeArray();
    $.ajax({
    	method: method,
    	url: action,
    	data: data,
    	dataType: 'script'
    });

  });
});