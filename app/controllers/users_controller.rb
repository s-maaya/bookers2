class UsersController < ApplicationController

 before_action :authenticate_user!
 #ログインしてないユーザーがアクセスするとログイン画面に跳ね返る。
 before_action :correct_user, only:[:edit, :update]

  def edit
  	@user = User.find(params[:id])
  end
  def update
  	@user = User.find(params[:id])
    if 	@user.update(user_params)
       flash[:notice] ="You have updated user successfully."
  	   redirect_to user_path(@user)
  else
      render :edit
    end
  end

  def show
  	@user = User.find(params[:id])
    @book =Book.new
  end

  def index
  	@book = Book.new
	 @users = User.all
    @user = current_user
  end

#ログインしてるユーザーのアクセス制限をかける。


private
  def correct_user
  @user = User.find(params[:id])
    if @user.id != current_user.id
    redirect_to user_path(current_user)
  end
end

	def user_params#どこのカラムなのか聞いている
		params.require(:user).permit(:name, :profile_image, :introduction)#IDいらない！！！！
	end
end

