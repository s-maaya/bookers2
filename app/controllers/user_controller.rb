class UserController < ApplicationController
  def edit
  	@user = User.find(params[:id])
  end
  def update
  	@user = User.find(params[:id])
  	@user.update(user_params)
  	redirect_to user_path(@user)
  end

  def show
  	@user = User.find(params[:id])
  end

private
	def user_params
		params.require(:user).permit(:name, :profile_image_id)#どこのカラムなのか聞いている
	end



end
