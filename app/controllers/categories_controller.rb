class CategoriesController < ApplicationController
  before_action :admin_user, except: [:show, :index]

  def index
    @category = Category.order('created_at DESC').paginate(page: params[:page])
  end

  def show
    @category = Category.find(params[:id])
    @artists= @category.artists
  end

  def new
    @category = Category.new
  end

  def edit
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:success] = "new category added!"
      redirect_to categories_path
    else
      render :new
    end
  end

  def update
    @category = Category.find(params[:id])

    if @category.update(category_params)
      redirect_to @category
    else
      render 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path, notice: "Successfully destroyed"
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end


