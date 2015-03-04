class UsersController < ApplicationController
  # before_action :authenticate_user!, except: [:show]
  
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
    @documents = @user.documents(current_user)
    if params[:id]
        @user = User.find(params[:id])
    else
      # Show the currently logged in user
      @user = current_user
    end
  end
    
  private
 
  def user_params
    params.require(:user).permit(:name, :email)
  end
end