document.addEventListener("turbolinks:load", function(){
  $(function(){
    $(".like").on("click", function(){
      $.ajax({
        url: $(this).attr("action"),
        type: "get"
      }).done(function(json){
        $(`#article${json.article}`).empty();
        if(json.liked == "like"){
          $(`#article${json.article}`).append(`<i class="fas fa-heart"></i>${json.like}`);
        }else{
          $(`#article${json.article}`).append(`<i class="far fa-heart"></i>${json.like}`);
        }
      })
    })
    $("#follow").on("click", function(){
      $.ajax({
        url: $(this).attr("action"),
        type: "get"
      }).done(function(json){
        if(json.follow == "follow"){
          $("#follow").text("フォロー中");
          $("#follower").text(json.follower);
        }else{
          $("#follow").text("フォロー");
          $("#follower").text(json.follower);
        }
      })
    })
  })
})