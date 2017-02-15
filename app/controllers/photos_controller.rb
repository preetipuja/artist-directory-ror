class PhotosController < ApplicationController
  before_action :admin_user, only: [ :destroy, :new]
  before_action :get_artist
  def new
    @photo = @artist.photos.new
  end

  def index
    @photos = @artist.photos.order('created_at DESC').paginate(page: params[:page])
  end

  def create
    @photo = @artist.photos.new(photo_params)
    if @photo.save
      redirect_to artist_photos_path(@artist), notice: "The image has been uploaded."
    else
      render "new"
    end
  end

  def destroy
    @photo = @artist.photos.find(params[:id])
    if @photo.destroy
      redirect_to artist_photos_path(@artist), notice:  "The image  has been deleted."
    else
      redirect_to artist_photos_path(@artist), notice:  "The image  has not been  deleted."
    end
  end

  private
  def photo_params
    params.require(:photo).permit(:title, :image)
  end


  def get_artist
    @artist = Artist.find(params[:artist_id])
  end
end
