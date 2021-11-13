class UsersController < ApplicationController

  def edit    
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:employee_number, :last_name, :first_name, :email, :department, :position)
  end
end
