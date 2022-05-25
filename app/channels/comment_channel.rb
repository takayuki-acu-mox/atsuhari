class CommentChannel < ApplicationCable::Channel
  def subscribed
    @therapy = Therapy.find(params[:therapy_id])
    stream_for @therapy
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
