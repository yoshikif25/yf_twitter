document.addEventListener("turbolinks:load", function(){
  $(function(){
    $(".title").on("click", function(){
      $(this).addClass("active");
      $.ajax({
        url: $(this).attr("action"),
        type: "get"
      }).done(function(){
        $(".active").css("font-weight", "bold");
      })
    })
  })
})