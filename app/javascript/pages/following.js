$(document).on("ready turbolinks:load", function () {


    $("#follow-button").on("click", function (e) {
      console.log(e);
      e.preventDefault();
      user = $(".follows_ids").data("id");
      profile = $(".follows_ids").data("profile_id");

      $.ajax({
        type: "POST",
        url: `/users/${profile}/follows.json`,
        data: {
          follower_user_id: user,
        },
        success: function () {
          console.log("I WAS CALLED");
          $("#follow-button").hide();
          $("#unfollow").show();
        },
        error: function () {
          alert("error");
          debugger;
        },
      });
    });
});

$(document).on("ready turbolinks:load", function () {
  $("#unfollow").on("click", function (e) {
    e.preventDefault();
    user = $(".follows_ids").data("id");
    profile = $(".follows_ids").data("profile_id");
    if (confirm("Are you sure you want to unfollow")) {
      $.ajax({
        type: "DELETE",
        url: `/users/${user}/follows/${profile}.json`,
        success: function() {
            $("#follow-button").show();
            $("#unfollow").hide();
        },
      });
    }
  });
});
