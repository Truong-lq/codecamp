function AjaxPostReview() {
  if (!(this instanceof AjaxPostReview)) return new AjaxPostReview();

  this.onClick = function () {
    const btn = $("#js-submit-btn");
    const book_id = btn.data("book_id");
    const url = `/ajax_post_review/${book_id}`;
    const content = $("#review_content");
    const msg = $("#js-msg");

    btn.on("click", function () {
      $.ajax({
        url,
        type: "POST",
        contentType: "application/json",
        data: JSON.stringify({
          review: { content: content.val() },
        }),
        success: (res) => {
          if (res?.msg) {
            msg.text(res.msg);
            return;
          }

          content.val("");
          msg.text("Review posted successful");
        },
      });
    });
  };
}

AjaxPostReview().onClick();
