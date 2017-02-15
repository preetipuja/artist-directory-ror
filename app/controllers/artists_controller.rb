class ArtistsController < ApplicationController
  before_action :admin_user, except: [:show, :index]

  def index
    @artists = Artist.includes(:category).order('created_at DESC').paginate(page: params[:page])
    @artists = @artists.where(category_id: params[:category_id]) if params[:category_id].present?
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def new
    @artist = Artist.new
    @artist.performances.build
  end

  def edit
    @artist = Artist.includes(:performances).find(params[:id])
  end

  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      flash[:success] = "new artist is created!"
      redirect_to artists_path
    else
      render :new
    end
  end

  def update
    @artist = Artist.find(params[:id])
    if @artist.update(artist_params)
      redirect_to @artist
    else
      render 'edit'
    end
  end

  def destroy
    @artist = Artist.find(params[:id])
    if @artist.destroy
      redirect_to artists_path, notice: "Successfully destroyed"
    else
      redirect_to artists_path, notice: "Not destroyed"
    end
  end

  def preview
    @artist = Artist.find(params[:id])
  end

  def add_performance
    @artist = Artist.find(params[:id])
    if @artist.update(performance_params)
      redirect_to @artist
    else
      render 'preview'
    end
  end

  private
  def artist_params
    params.require(:artist).permit(:name, :email, :location, :year_of_birth, :category_id, :image)
  end

  def performance_params
    params.require(:artist).permit(:performance)
  end

end



