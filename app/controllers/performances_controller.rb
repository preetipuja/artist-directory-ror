class PerformancesController < ApplicationController
  before_action :admin_user, only: [ :destroy, :new]
  def index
     @artist = Artist.find(params[:artist_id])
    @performances = @artist.performances.order('created_at DESC').paginate(page: params[:page])
  end

  def show
    @artist = Artist.find(params[:artist_id])
    @performance = @artist.performances.find(params[:id])
  end

  def new
    @artist = Artist.find(params[:artist_id])
    @performance = @artist.performances.new
  end

  def edit
    @artist = Artist.find(params[:artist_id])
    @performance = @artist.performances.find(params[:id])
  end

  def create
    @artist = Artist.find(params[:artist_id])
    @performance = @artist.performances.new(performance_params)
    if @performance.save
      flash[:success] = "new performance added!"
      redirect_to artist_performances_path(@artist)
    else
      render :new
    end
  end

  def update
    @artist = Artist.find(params[:artist_id])
    @performance = @artist.performances.find(params[:id])
    if @performance.update(performance_params)
      redirect_to artist_performance_path(@artist, @performance)
    else
      render 'edit'
    end
  end

  def destroy
    @artist = Artist.find(params[:artist_id])
    @performance = @artist.performances.find(params[:id])
    if @performance.destroy
      redirect_to artist_performances_path(@artist), notice: "Successfully destroyed"
    else
      redirect_to artist_performances_path(@artist), notice: "Not destroyed"   end
  end

  private
  def performance_params
    params.require(:performance).permit(:media_url, :title)
  end
end


