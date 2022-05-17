$(document).on("ready turbolinks:load", function () {
  let preFollow = $(".follows_ids").data("pre_follow");
  function showFollowButton(){

    if (preFollow > 0 ){
     $(".follow-button").removeClass("hidden");
    } else if (preFollow <= 0 ){
      $(".unfollow-button").removeClass("hidden");
    }

  };
  showFollowButton();
  $(".follow-button").on("click", function (e) {
    console.log(e);
    e.preventDefault();
    user = $(".follows_ids").data("id");
    profile = $(".follows_ids").data("profile_id");
    let followButton = document.querySelector(".follow-button");
    if (followButton.className == "follow-button") {$.ajax({
      type: "POST",
      url: `/users/${profile}/follows.json`,
      data: {
        follower_user_id: user,
      },
      success: function () {
        console.log("I WAS CALLED");
        $(".follow-button").addClass("hidden");
        $(".unfollow-button").removeClass("hidden");
      },
      error: function () {
        alert("error");
        debugger;
      },
    });
  } 
  });

  $(".unfollow-button").on("click", function (e) {
    e.preventDefault();
    user = $(".follows_ids").data("id");
    profile = $(".follows_ids").data("profile_id");
    if (confirm("Are you sure you want to unfollow")) {
      $.ajax({
        type: "DELETE",
        url: `/users/${user}/follows/${profile}.json`,
        success: function () {
        $(".unfollow-button").addClass("hidden");
        $(".follow-button").removeClass("hidden");
        },
      });
    }
  });
});
