$(document).ready(function(){
  $('#hashtag').change(function(){
    $.get('/get_tweets', {hashtag: $(this).val()},function(data){
      $('#tweets').html(data)
    })
  })
})