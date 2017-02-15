class FeedbacksController < ApplicationController
  before_action :get_artist

  def index
    @feedbacks = @artist.feedbacks.order('created_at DESC').paginate(page: params[:page])
  end

  def new
    @feedback = @artist.feedbacks.new
  end

  def edit
    @feedback = @artist.feedbacks.find(params[:id])
  end

  def create
    @feedback = @artist.feedbacks.new(feedback_params)
    @feedback.user = current_user

    if @feedback.save
      redirect_to artist_feedbacks_path(@artist), notice: "The feedback has been added."
    else
      render "new"
    end
  end

  def update
    @feedback = @artist.feedbacks.find(params[:id])

    if @feedback.update(feedback_params)
      redirect_to artist_feedback_path(@artist, @feedback)
    else
      render 'edit'
    end
  end

  def destroy
    @feedback = @artist.feedbacks.find(params[:id])
    if @feedback.destroy
      redirect_to artist_feedbacks_path(@artist), notice:  "The feedback  has been deleted."
    else
      redirect_to artist_feedbacks_path(@artist), notice:  "The feedback  has not been  deleted."
    end
  end

  private
  def feedback_params
    params.require(:feedback).permit(:review, :rating)
  end

  def get_artist
    @artist = Artist.find(params[:artist_id])
  end

end
