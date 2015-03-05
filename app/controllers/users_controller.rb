class UsersController < ApplicationController
   before_action :authenticate_user!
  
  def index
   
  end

  def update
    if current_user.update_attributes(user_params)
      flash[:notice] = "User information updated"
      redirect_to edit_user_registration_path
    else
    render "devise/registrations/edit"
    end
  end

  def show
    @user = User.find(params[:id])
    
  end
    
  private
 
  def user_params
    params.require(:user).permit(:name, :avatar, :username, :email,:title, :content, :description, :category_id)
  end
end