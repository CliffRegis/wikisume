class CategoriesController < ApplicationController
    before_action :find_category, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!
  
  def index
   
  end

  def new
    @category = current_user.categories.build
  end

  def create
    @category = current_user.categories.build(category_params)
    if @category.save
      redirect_to root_path, notice:"category was saved"
    else
      render 'new'
    end
  end


  def show
    # @category_id = Category.find_by(name: params[:category]).user_id
    # @documents = Document.where(category_id: @category_id)

  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to root_path
    else 
      render 'edit'
    end
  end

  def destroy
    if @category.destroy
      flash[:notice] = "category was deleted."
      redirect_to root_path
    else
      flash[:error] = "Error with deleting category. Please try again."
      render :show
    end
  end
  
  private
  def find_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :user_id, :document_id)
  end
end
