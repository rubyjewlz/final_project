$(function(){
  $('#save-mix').click(function(){
    ids = $('.track-checkbox:checked').map(function(idx, el){
      return $(el).data("id");
    }).get();

    $.post('/mixes', {track_ids: ids}, function(resp){
      window.location = '/mixes/' + resp.id;
    });

  });
});
