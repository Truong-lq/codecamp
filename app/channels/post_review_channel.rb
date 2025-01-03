class PostReviewChannel < ApplicationCable::Channel
  def subscribed
    stream_from "post_review_channel"
  end

  def unsubscribed
    stop_all_streams
  end
end
