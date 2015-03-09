class DocumentsController < ApplicationController
    before_action :find_document, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, except: [:index, :show]
  
  def index
    if params[:category].blank?
      @documents = Document.all.order('created_at DESC')
    else
      @category_id = Category.find_by(name: params[:category]).id
      @documents = Document.where(category_id: @category_id).order("created_at DESC")
    end
  end

  def new
    @document = current_user.documents.build
  end

  def create
    @document = current_user.documents.build(document_params)
    if @document.save
      redirect_to @document, notice:"Document was saved"
    else
      render 'new'
    end
  end

  def show
   
  end

  def edit
  end

  def update
    if @document.update(document_params)
      redirect_to @document
    else 
      render 'edit'
    end
    @ddocument = @document.content
    @dupdocument = @ddocument.dup
  end

  def destroy
    if @document.destroy
      flash[:notice] = "document was deleted."
      redirect_to root_path
    else
      flash[:error] = "Error with deleting document. Please try again."
      render :show
    end
  end
  
  private
  def find_document
    @document = Document.find(params[:id])
  end

  def document_params
    params.require(:document).permit(:title, :content, :description, :category_id)
  end
end
