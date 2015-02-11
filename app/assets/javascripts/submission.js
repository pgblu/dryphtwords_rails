$(function() {
  $('.guess').on("click", function(e) {
    e.preventDefault();
    var puzzleID = $(this).attr('id');
    var $firstWord = $('ul').children().first();
    var yourGuess = $firstWord.text().replace(/[\n\s]+/g,'');
    var myUrl = "/puzzles/" + puzzleID + "/submit/" + yourGuess;

    var request = $.ajax({
      url: myUrl,
      method: 'post',
      dataType: 'json',
      data: yourGuess
    });

    request.done(function(data){
      $('.outcome-div').css("background-color", "#" + data.tint);
      $('.outcome-div').children().detach();
      $('.outcome-div').append('<span class="' + data.result + '">' + data.result + '</span>');
      if (data.result == "correct") {
        $('.guess').hide();
        $('.nav').text("New puzzle");
        $('p.stats span').css('color', '#FEFEEB');
      }
    });
  })
})