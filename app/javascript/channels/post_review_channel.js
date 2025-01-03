import consumer from "channels/consumer";

consumer.subscriptions.create("PostReviewChannel", {
  connected() {
    console.log("connected");
  },

  disconnected() {},

  received(data) {
    const container = $("#js-review-list");

    if (container && data) {
      container.html(data);
    }
  },
});
